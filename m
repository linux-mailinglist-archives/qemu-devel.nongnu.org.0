Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B373B48CE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:32:36 +0200 (CEST)
Received: from localhost ([::1]:53212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqd1-0006nk-De
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqYi-00034G-27
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:28:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqYc-0001pB-UI
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:28:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624645682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xRS/WAkrD/uvVN2KAhqe8kLXajIswdpEobF85PggjXE=;
 b=PMqczZdUsi1XVi+BYdxXxxwtf7N2AJmN6BGs9GE/TthP0qr+6SbGZdXB91VNv7fhJu9QH4
 CBw7lQlA/W95F9hY4JcB+nxUIfUNkeQM5oId45LQoCyqJdb24/Niyo6f7q7jE6afaRvVlg
 DssQOVyTfdYfJBJhg2WUTXxhLBsLl0U=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-wopzGwnoOl22ziZda0tGuw-1; Fri, 25 Jun 2021 14:28:00 -0400
X-MC-Unique: wopzGwnoOl22ziZda0tGuw-1
Received: by mail-ua1-f72.google.com with SMTP id
 u25-20020ab029990000b02902797ae60573so2685223uap.14
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 11:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xRS/WAkrD/uvVN2KAhqe8kLXajIswdpEobF85PggjXE=;
 b=BlOU878Ov/4hCex6Mn/WadRQMyxRATmTOb0eUOC2QSDz7YK7IG3J7kEdkWkMyyzYcZ
 wIoTcGD8lqqoyED3omHOeVc7OTzUtZFYuhSkDMAmvIMyttE6MF6TV0Fc6VURzGKYeSIG
 qiL7UcAb6ghzBaiSfwmx0Ms4lJn4sQ54Ck448QIe7s65fsioI0/4Fg4YMZIamN8YFAue
 umF8hgk1T+teRag1bheFvGS90gfHm1XzjS4PF3IYtq9qBiIF86WbmzmDdH8molXFklU3
 rxBxq4Q37Xg5N4EGvabHYZ8kYF1J+8DZ6DY7HyJ4RWdg+1fXn/sOU07F+ouvGl5/c2vk
 ++lQ==
X-Gm-Message-State: AOAM5308JqujgqDDuq7yrhYlSM0u7aVIriFrbg3USqMNmvu/5CU6aTLY
 m8ApinQgaS+bpNGskDDzLG9vTriyE85Qc2RbZt9Nig8SFTfzAWARP1wgAfbfsOWdEBIG2mYAOa1
 uKRcwpOE2jh4ln+QglZxRgXK4AXU9/8w=
X-Received: by 2002:a05:6102:747:: with SMTP id
 v7mr10386714vsg.50.1624645680519; 
 Fri, 25 Jun 2021 11:28:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxY/on7OF2izaV9tkhTjp1ofBmpSCM2KSwyXil+G1H8gRxQKRKM0JWggQjSQedZDH1k92SOJTI8G+5B4W0TYrM=
X-Received: by 2002:a05:6102:747:: with SMTP id
 v7mr10386693vsg.50.1624645680356; 
 Fri, 25 Jun 2021 11:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-7-jsnow@redhat.com>
In-Reply-To: <20210625154540.783306-7-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 25 Jun 2021 15:27:34 -0300
Message-ID: <CAKJDGDYccurhdax122MHnE0M7=nzkU=H-PrzyZ7T5nCcTG2kiQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] python: rename 'venv-check' target to 'check-pipenv'
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 25, 2021 at 12:46 PM John Snow <jsnow@redhat.com> wrote:
>
> Well, Cleber was right, this is a better name.
>
> In preparation for adding a different kind of virtual environment check
> (One that simply uses whichever version of Python you happen to have),
> rename this test 'check-pipenv' so that it matches the CI job
> 'check-python-pipenv'.
>
> Remove the "If you don't know which test to run" hint, because it's not
> actually likely you have Python 3.6 installed to be able to run the
> test. It's still the test I'd most prefer you to run, but it's not the
> test you are most likely to be able to run.
>
> Rename the 'venv' target to 'pipenv' as well, and move the more
> pertinent help text under the 'check-pipenv' target.
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/README.rst              |  2 +-
>  .gitlab-ci.d/static_checks.yml |  2 +-
>  python/Makefile                | 21 +++++++++++----------
>  3 files changed, 13 insertions(+), 12 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


