Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9BF35D0B7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 21:02:53 +0200 (CEST)
Received: from localhost ([::1]:56352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW1pk-0006mW-77
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 15:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lW1mr-00066B-Sr
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 14:59:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lW1mo-0006tl-8N
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 14:59:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618253988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mQZJuYGAu7Os4fm6yu0e4SQ1vfbYm7SKzwHzOJnVRP0=;
 b=dc+Lp1Cwy/iik/3+Az4zIpg+SRCa6+lZ7u/cvA4JBceVoJTYB6JNU0VkrjG/U1I/p6WJJm
 u0JRNgxCkpZkTD0ruSbjjeMp/19kp7GbOjs22HjNyh2oFw9+tLQcGY9/2PJsVd3g6lExEl
 7eXyekdte0+g4je3QRpUYF+NT6ee3Iw=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-srU4O2L9MqCZFXLvNQ26Jg-1; Mon, 12 Apr 2021 14:59:46 -0400
X-MC-Unique: srU4O2L9MqCZFXLvNQ26Jg-1
Received: by mail-vs1-f69.google.com with SMTP id
 a24-20020a67ca980000b02902078c4153f6so93432vsl.16
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 11:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mQZJuYGAu7Os4fm6yu0e4SQ1vfbYm7SKzwHzOJnVRP0=;
 b=r0leV90PuleF3+JVrsSYpwRQ0ZvOjuXpmnXsd58jUAeQ08QF8RRw4sAcRjLhOxopv+
 g/GjKwgkcpTQ1Cr6QG+NmwHehqgR1lxnF9ax+K/BQOnJxm/urCmex6jJiFGzU8L9OMyn
 f21ad2zwWxbaeAgSXFe0hSR3FoWnJWVP3OF4frmEWtNC4p0r1UYrON1sCl0Hpk9WL6pj
 H2we6rZJiFNpycSGAsXawG91qv0BeotaQsPhbf+JLYR//vlDIMtD27tseVxwNpbpGDOz
 tuuuhtecT/TekFP/YKjLD4sOP4qUFtc7Wbze74sUMDETdhYc73qHtgbzMrYLsFhTRo3N
 Bs9Q==
X-Gm-Message-State: AOAM5317z4zvyn7HgZp+4ZflWs+GMXJngfRFmdZVDjCLSlTn7Gvg6G9j
 esZ1mysACsJeaw6nlII3JeSn9GeQaHHVY1Le3xMdnjo9zLm/gweVlk4krPJ3rEDfD1E+Spo30Qe
 W27IcJZI09SD/2dNvqCs4s/4pty0C9xs=
X-Received: by 2002:a67:ee0a:: with SMTP id f10mr11454225vsp.50.1618253986322; 
 Mon, 12 Apr 2021 11:59:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuHROD4yI39BWqCgDBAVqPaEO2ceDXPN6VOu3879CnnbohwwvOL7dlNq+FMkhUb2gBYnBwkhpjwdyl31lIiDE=
X-Received: by 2002:a67:ee0a:: with SMTP id f10mr11454212vsp.50.1618253986068; 
 Mon, 12 Apr 2021 11:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210412044644.55083-1-crosa@redhat.com>
 <20210412044644.55083-12-crosa@redhat.com>
In-Reply-To: <20210412044644.55083-12-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 12 Apr 2021 15:59:20 -0300
Message-ID: <CAKJDGDZ9knmvombBmUnCMqK9M80uqw+h3F3HwAy=9SPis8VSdA@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] tests/acceptance/virtiofs_submounts.py: fix
 setup of SSH pubkey
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 12, 2021 at 1:48 AM Cleber Rosa <crosa@redhat.com> wrote:
>
> The public key argument should be a path to a file, and not the
> public key data.
>
> Reported-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/virtiofs_submounts.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


