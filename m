Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AD93BD88B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 16:40:38 +0200 (CEST)
Received: from localhost ([::1]:58854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mFZ-0000HE-Im
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 10:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0mEd-00080f-9n
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:39:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0mEb-0006zD-6l
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 10:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625582376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c7iazc0nYG3S281RSNveXov2bzygF00L3OxNyrlpP+4=;
 b=d6EI5Y75PgeMgdyki+SOG+xPdL/m+kVwUWUXzTGk2v/AchGMR6iMEhEyywMNm6HrxMQhhj
 cpitF5PPy1JAnV+PasWBNenXIm/SOjoh7JO4qXju01vavf43qRqDUEBsW2XoFXstMcm7Wb
 kXRS2Px0bxxSPcLZF8pPBZ1r9wwT1Lg=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-gVuG-e_jNbOhouMIagtsMg-1; Tue, 06 Jul 2021 10:39:34 -0400
X-MC-Unique: gVuG-e_jNbOhouMIagtsMg-1
Received: by mail-vk1-f198.google.com with SMTP id
 i7-20020a0561222087b0290257228a888aso3250891vkd.18
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 07:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c7iazc0nYG3S281RSNveXov2bzygF00L3OxNyrlpP+4=;
 b=NyFKi553vr21rRPkYtNjtGD7oztVBPLIz4VG7xZjoztH5DXqh1bKpzRcFtOMPqBhm5
 KiXZplN4dWV4LjLOrv6rHxsEfNsYzjOyZkonfRWRDXVIIxDKdXmyz6xyXPqcQqyEo0LV
 mPueP+h+zBy54xGZ3aH1tKcIr8m0rFQokqmSR1inBAbMbNXniewMcz/bayWh2UE75w/l
 g2GU5eabyS9SageHJOy1fp26XB+6Ju75RIUWQdKhAB89xzMLrTEFNve3XmX/UJmD3jBG
 0w/zGWXOPhVkJpY/3jzOtUb1TeV2vBnWnc/6XYLgK7yr0+g3c5Co6HhZsnBhSK9pAQTO
 wDWQ==
X-Gm-Message-State: AOAM530prT2JsrCeoPlTGf/V/oDoxPBYugwIy9HZGgsWgB9c8RDCuxpV
 KhJzsqDu2w+pOV5w4SQrH1j8V9OBK3jaHBMDHaSyREZJGlDypT9gVkDzcOSTvjC47EYQesTaXwe
 ZtBx/lcIKntYut4JDi/pvtlTAVbck5Rk=
X-Received: by 2002:a1f:e3c2:: with SMTP id a185mr13613582vkh.7.1625582374432; 
 Tue, 06 Jul 2021 07:39:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi88/YP00vXsy3tPtXK6BTReGFkgIjYRJMbAU7+ijcbr69L3ZW1rtH4SXbm7f7ykJRzvWjsLBbcv0yZZqiDPA=
X-Received: by 2002:a1f:e3c2:: with SMTP id a185mr13613544vkh.7.1625582374092; 
 Tue, 06 Jul 2021 07:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210706131729.30749-1-eric.auger@redhat.com>
 <20210706131729.30749-4-eric.auger@redhat.com>
 <cc5d8c32-4014-96aa-73cd-da0c4d41a59a@redhat.com>
 <43273a56-8deb-3db5-2a90-96f508b3a2d4@redhat.com>
 <c15f5c68-0580-84c4-3ed6-eaa29aa6d036@redhat.com>
In-Reply-To: <c15f5c68-0580-84c4-3ed6-eaa29aa6d036@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 6 Jul 2021 11:39:08 -0300
Message-ID: <CAKJDGDYQMXU6xOD6OOoHCyV1z_hUoWQZzsVQ5XefkcwUsG2eZw@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] avocado_qemu: Add SMMUv3 tests
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Wainer Moschetta <wainersm@redhat.com>,
 Cleber Rosa Junior <crosa@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 6, 2021 at 11:25 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 7/6/21 3:57 PM, Eric Auger wrote:
> > Hi Philippe,
> >
> > On 7/6/21 3:34 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >> On 7/6/21 3:17 PM, Eric Auger wrote:
> >>> Add new tests checking the good behavior of the SMMUv3 protecting
> >>> 2 virtio pci devices (block and net). We check the guest boots and
> >>> we are able to install a package. Different guest configs are tested:
> >>> standard, passthrough an strict=3D0. This is tested with both fedora =
31 and
> >>> 33. The former uses a 5.3 kernel without range invalidation whereas t=
he
> >>> latter uses a 5.8 kernel that features range invalidation.
> >>>
> >>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> >>> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> >>> Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> >>>
> >>> ---
> >>>
> >>> v4 -> v5:
> >>> - Added the skipIf statement (William) and William's R-b
> >>> - added Wainer's R-b and T-b
> >>> ---
> >>>  tests/acceptance/smmu.py | 133 +++++++++++++++++++++++++++++++++++++=
++
> >>>  1 file changed, 133 insertions(+)
> >>>  create mode 100644 tests/acceptance/smmu.py
> >>> +    def run_and_check(self):
> >>> +        if self.kernel_path:
> >>> +            self.vm.add_args('-kernel', self.kernel_path,
> >>> +                             '-append', self.kernel_params,
> >>> +                             '-initrd', self.initrd_path)
> >>> +        self.launch_and_wait()
> >> IIUC above is the 'run' part and below is the 'check' part?
> >>
> >> So the check succeed if the VM booted, right?
> >>
> >>> +        self.ssh_command('cat /proc/cmdline')
> >>> +        self.ssh_command('dnf -y install numactl-devel')
> >
> > For the test to succeed, the guests needs to boot, the ssh connection
> > needs to be established and  the dnf command needs to complete.
> > See launch_and_wait() in __init__.py
>
> OK. I see the Test class provide a .fail() method:
>
>   fail(msg=3DNone)
>
>     Signals a test failure unconditionally, with msg or None
>     for the error message.
>
> but no .succeed() one...
>
> Willian: Should we add a comment here mentioning the test
> succeeded by that point? Would it be more explicit to add
> .succeed() in avocado.Test or avocado_qemu.Test?
>

If the test does not fail, it will succeed anyway.

I miss some assert statements in this test, telling what is really
tested, but as it won't run on CI, I don't see a problem adding it now
and extending it later.


