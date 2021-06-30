Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AC83B8816
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 19:58:58 +0200 (CEST)
Received: from localhost ([::1]:53016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyeUD-0003G1-3Y
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 13:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lyeSC-000234-Dm
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 13:56:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lyeSA-0004QL-SG
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 13:56:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625075810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lOCQTM9LkVowZqEUWYBYS+qvnywoB1OopWupTDg6eAY=;
 b=dvHhniC5xaMw471rOV85oETyHIZoyRsrJlnp82yR3SyeTnCOE25nDZGQEOge+eZqlWrcuM
 0m+2Uex7NyXG8g/swX+7xgvm9vQNvcPnB1lydS+DIFb1ovwmR1zXi0vAhB5iiWXEL+VtIg
 PkpAw4dZ63tUWCVmWwZG5TuCx1KDMUQ=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-SCW3O0QtPfGJP-Rp9KhFAQ-1; Wed, 30 Jun 2021 13:56:48 -0400
X-MC-Unique: SCW3O0QtPfGJP-Rp9KhFAQ-1
Received: by mail-vk1-f198.google.com with SMTP id
 j5-20020a1fa0050000b0290256e0128074so42783vke.8
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 10:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lOCQTM9LkVowZqEUWYBYS+qvnywoB1OopWupTDg6eAY=;
 b=Dd42im7O2s/ZXhG7JlTOfjLAiv2QxyskcvRMJR6Z2ZLOfwIO4MKD9q/TPL6WkWlp87
 KQggm6CAB1XAOHWIysqpkeC/zFneLB2PCeQBbW19hiBXnHobNGR8lqbx5D9ugZeLk85V
 bBqFCE7OSd5jLTM+WivQorgWowSANVHGUzkNM+jcTI7OTOJ/OZhCqMR4LSVe5pNn87SX
 B8c4rc0AHE3FmoUEREvOtS4dnPg+++T5jfuymdezN4kgQQwl3UWoAiewAlg6Gj0cQwUc
 eaJWsviq3rKsuHT7mYtXKRcboCtRL/PyqITsIL26kM7IfjV9nc/bnhKToOnJtjzwvDhs
 mYMw==
X-Gm-Message-State: AOAM531Dz35/99EvHhXPnzjSQjTui298f2YyJNB50pUia3Mztr6p7DKl
 Hd3514dIViN6lJEUTjCPFoPW226ubLznfZROU8pL2UGDylHB2Q95Co/yi/PgCasEFh6jzabAJgT
 YOmzAksT+huK5B6jixmLMiUDlBjcPPXA=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr36112880uam.110.1625075808154; 
 Wed, 30 Jun 2021 10:56:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8/xx1MJVwaC0QTtkUo+vCrG7nIn2kxnUP4hdnv0wcSN4CV4+vC3CAGryuy1O4o08JsGzwZI+vWe7gF8aIav4=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr36112843uam.110.1625075807846; 
 Wed, 30 Jun 2021 10:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210630012619.115262-1-crosa@redhat.com>
 <20210630012619.115262-3-crosa@redhat.com>
In-Reply-To: <20210630012619.115262-3-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 30 Jun 2021 14:56:21 -0300
Message-ID: <CAKJDGDZGyE_QQ0OUXnrLQiWjpr7V2perB4xC76JKWrWOe3ge-A@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] Jobs based on custom runners: build environment
 docs and playbook
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 10:26 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> To run basic jobs on custom runners, the environment needs to be
> properly set up.  The most common requirement is having the right
> packages installed.
>
> The playbook introduced here covers the QEMU's project s390x and
> aarch64 machines.  At the time this is being proposed, those machines
> have already had this playbook applied to them.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  docs/devel/ci.rst                      |  40 +++++++++
>  scripts/ci/setup/.gitignore            |   2 +
>  scripts/ci/setup/build-environment.yml | 116 +++++++++++++++++++++++++
>  scripts/ci/setup/inventory.template    |   1 +
>  4 files changed, 159 insertions(+)
>  create mode 100644 scripts/ci/setup/.gitignore
>  create mode 100644 scripts/ci/setup/build-environment.yml
>  create mode 100644 scripts/ci/setup/inventory.template
>

Ran the playbook and built QEMU for testing without problems.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Willian Rampazzo <willianr@redhat.com>


