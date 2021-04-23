Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C618F369784
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 18:58:52 +0200 (CEST)
Received: from localhost ([::1]:45314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZz8l-00035C-TR
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 12:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lZz5w-00013X-7A
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:55:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lZz5t-0008PG-Tw
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:55:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619196952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m9gormxBnG8/F4qQCrJ5MCPGLs+hibvBpICJojLceT8=;
 b=KbLOEudm0OVGe6bTXOV0nS5x+HstLBa8/IxoV5sz4WZchoQF6CvLgz/FsjQ9mQ8GedlO17
 kAeSyGGX+RFaVhgaTpC9WUxuheEwE9aoKlCESvc9Lu+wporqn4+aPtsnRfypdymezgz5yw
 yk2bcnIUSnRD29E1X2yPxvPzTUbz0TE=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-XOhSEPufNyOKhmxJpQAe9w-1; Fri, 23 Apr 2021 12:55:49 -0400
X-MC-Unique: XOhSEPufNyOKhmxJpQAe9w-1
Received: by mail-vs1-f69.google.com with SMTP id
 3-20020a6717030000b029016d08542c7dso8415768vsx.14
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 09:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m9gormxBnG8/F4qQCrJ5MCPGLs+hibvBpICJojLceT8=;
 b=WEfyFl5nqdypuCcRqrDqn1vWAUJ9DAfQDuJzmz/X7ftK1w00GeDMAb3Se+Zccn6meK
 d50yNqDCrONx29+bLvqoqARlfH4+Pw1xPUJDPh1x+z8ysvOhJu42MvSS7+7RJuL0e59a
 0tfXYTp1d+VBXJPZpo/X0t0ysmN46pVOXPBhUpIw7Y+HKoAnFKLcGfhxcqy1uREXyT4a
 F+rOYAR9aYZXQlDBmCjyGE+8Npwn8mC2FpyIVLAwuaTE/kAvqBIDYXfYiim9LEDj2eNX
 pNTjSzC4QUfkQ+kEARmgIfFxeuMHVbxK07eykGEJeIVEATGSwl37325Hg0ywPaLt6fAU
 iC8w==
X-Gm-Message-State: AOAM530I5srd+WDpCZUk8TLyOs86pEdykIKoIG2EI/urHW4l0w2mEANv
 OxSMkLR2FPZHQ6aN4ZEOJn+er7dRp4WEQSYSsmlL+SdvCggObjjW1qrPCtat0bsjcEnRmbDWwzi
 3LFAAhHz6wLdqoNE/nWKIHiIXP1Sz3sY=
X-Received: by 2002:a1f:1f4a:: with SMTP id f71mr4646127vkf.7.1619196948531;
 Fri, 23 Apr 2021 09:55:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzg9w8/HturiExkBP9jeaZbPbLft57xvlv47znyODWG99U8gs9ClKI7iRrar5qcO/1ABiepd/okw7HuQN4jQ1k=
X-Received: by 2002:a1f:1f4a:: with SMTP id f71mr4646111vkf.7.1619196948362;
 Fri, 23 Apr 2021 09:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210408195237.3489296-1-wainersm@redhat.com>
 <20210408195237.3489296-2-wainersm@redhat.com>
In-Reply-To: <20210408195237.3489296-2-wainersm@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 23 Apr 2021 13:55:22 -0300
Message-ID: <CAKJDGDbR0rtWddZ-iRrfR94YGQeJ1gzk1iYWcvbmiXTw5TDAyg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] tests/acceptance: Automatic set -cpu to the test vm
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
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
Cc: Philippe Mathieu Daude <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 8, 2021 at 5:01 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> This introduces a new feature to the functional tests: automatic setting of
> the '-cpu VALUE' option to the created vm if the test is tagged with
> 'cpu:VALUE'. The 'cpu' property is made available to the test object as well.
>
> For example, for a simple test as:
>
>     def test(self):
>         """
>         :avocado: tags=cpu:host
>         """
>         self.assertEqual(self.cpu, "host")
>         self.vm.launch()
>
> The resulting QEMU evocation will be like:
>
>     qemu-system-x86_64 -display none -vga none -chardev socket,id=mon,path=/var/tmp/avo_qemu_sock_pdgzbgd_/qemu-1135557-monitor.sock -mon chardev=mon,mode=control -cpu host
>
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  docs/devel/testing.rst                    | 17 +++++++++++++++++
>  tests/acceptance/avocado_qemu/__init__.py |  5 +++++
>  2 files changed, 22 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


