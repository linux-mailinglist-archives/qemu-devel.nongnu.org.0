Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F94676843
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 20:09:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJIVl-0006YE-BK; Sat, 21 Jan 2023 13:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pJIVj-0006Y3-49
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 13:22:39 -0500
Received: from sonic312-24.consmr.mail.gq1.yahoo.com ([98.137.69.205])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pJITF-0005F9-6o
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 13:22:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1674325156; bh=GzDM3shPM+0VlMkN3ZhiZfEOMRwJWSsmB8h8wEu9+b0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=MzH6jfZMq24WNkJQ6Arb4p9iEG2pW1MIi51XFbDUG5hCUnfwGSrhYhd8NMcwqjLnPW29GQGr8Jqb3hpT4e0QTzQ11dxPrZUdBvD5clZXgsDIucQnlbjyf7qbnkDL05nst7TAd2m5WPu/Hz3DfMV5dg14jmLKuxUFMPbOyXVcdY9ufNxRi91HiLQMBeqUW1SeykkuUpf9FsmpiNmtxuYeMxrRsWN1yhKedaX/Z7UdP9m6G16cDuyS85cyWrVWjIp8r+5vzwAFulc078W/yvH4h9wQ69PS+phWJtcQONsz9aP2sfaRQQ9POt1KutcsuBkRV1NYBTd8Uf30HzZdX0ifCQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1674325156; bh=rWUWi0Qdld4g51O7BCwcykDXNQrPvReWN74sOkXnq2F=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=gIy2pK1WjyPI3QULj+MT0jwbPhcKXsCQ2YDZjhxO3PkAaz3j7ClFUq0Px4qbRCjy0rIguYQzIUleMdK5HKaH8N4+M4I68/9QI9aGzVwjFimoTR1PetK6yLY5TkrWv/vtzyvueV5fRvbcxDpUxAswuIUioqDfBUwl1EKux1mnQqFGPLGluGqRBQZcCUAIFI1LAPbP2miWcutBarjZI18FfsrqWzhQkmwploQ/PZEjGQLnarLZDtquyRHLyLPNMCldZ9YB0tEL+NuX+HcvTEPkWpO1kqQjKo53iGxIm/6DVffV8lI69y+xi6UfYSQGbd8gcCqRPAkVHY+785YgKUzDEQ==
X-YMail-OSG: Z8rqCdYVM1m8DRiBBCrtes5ktRs4bL1jTcvO.gGFc7LXmWwbbjw.2TuS45m71wi
 w_C.9WLcHesjYZA70xSDQIA0fLwyM.wxxMo8qE8JNJnBqkvRE6HYLR3SQ2SkHiz85d.xlmjWf6El
 9Lwyc.TDA7XRkO9ZqXR97V1aEnWGXBf3Kqe_8.5KYaUAUF_5Ms7tkRlHPslmGV3bdYTJgEo9O8sS
 GGDNUCEtbfaM5DRTtE_z88IEqjOaO0VKjhEMvNgshGCP0FOkVVojoXAJ5TgF6g5j8F6T5Mym5WHe
 QM9vHNxfW54OueXos9xxOgnFu02EuAQSJBJKdoaQWFn9faDIK8do6iDLdL1MEZZlIe1n0sHl2f8E
 yfSkr2rKO0UIC8Shufly.NNa9SClhQ3T6pKEtfzhW3cQaBpiTyaoAE30fpDwFUB4XfkmqaxgPkSO
 ypIXK39S74J4_2o1ghLefyOlsbTc79Uq_eN2tz0ePdAV9C954A1Bi4aYHpQKt.tsczjQkNYYMYoH
 wAIzGKcM.x.RZX5bDQa3RCMMVmi5K_IzQ77uqZ0gyK6tpCLy6tzmTtZHGdma_78p0btLHo10uIEW
 RBEJ7Imax6YkjAzEOpYq1xe1MnJtrEpgurXBiPcUGtx.t.yhRKw9ikU1cxVNKPLvSxH2uNEn_Hgh
 z5T.eQnjJDXwJik0fOtvMeTPdsNrNZWQhLFd.WgBGoquenJnjkH7gbsS6mhiWsbwyFyHLU9ZmRz9
 2dY5XXvaVjzbU95xmqQGZdp5bNNZE9xA4U.dWk7XK1Jx7x.t97U1cWSLrpzZd8rO6A6JSY7.M0WD
 v2q0jo0w0V_YsZ2wvRi4RFhEOtD0pt7VmFeMA.MYO4gFWqjam6sa.5kewiYPzpcYLn0hLQkYex6x
 dY8_8dg8DNRdcmYEGFlEsP7KSnsXDHBNTl5p7cE2b63aLGuElTxOz30..vSI9yHfDVci34pGEj.i
 _Hu6V7eU3pSDi9fhjRcOT_O8W92eFolM1aInYPDxxXo07hsC01I99h4WYDmR39DhbOeWSfudRmbK
 VxYQseGyDQT9LM2APFun7G9vv5EbDJaHCljtGiPcXCvxMJ0zT9Uc1ZbdAWjsiivmT1HCB75tDNM5
 LaU4rDmjip9WBkZkHRVbuD0.NBIA9B2.My0C9anlH.ru2KaDPyc6b60beriiFEJRcM0NJGdcsf6G
 czNIQ8wWKL.ndH5rohQKp5kvRQJxxg7vukIj.rUdNXm9Zhgmck2LNVXBhhN9dErMLg6wsMn_GNZn
 Szk9ZnkmMK93ILw7.Rc9w.rfmSWFg8V1Yo1nM73.i1yIYs7hd5qsUUnRiHvUr7kPs3E2UsiAvcKL
 ZvVRrtATYpmzfftz7GIptP5THKMsFriPt.j1IzRbWAAnYuq6efAe74g4eQFVOeMGjSP.Sfe9iA6f
 3jyayngOAEJ.zIIsCfzUdHHEd_8cMfdXmg3q5fVlOI3zlMkcRPw93eNKcVrKt5m0_RjumhOR_DhG
 i4DJDNwNRBaqRxZ3JJklqylaV6hrwTeS2Fbe0VGZpI_heFO4cmiKHPyw2HOcLiT.6syQPl.VfMKD
 wi5nvukNKy9AAANFE8m9zDQqoQZBXWg5HGUYCEbIDAv1lBdUhKQ3w9xQYWWlONWIDLHwV4xsw6Mb
 Yoqu3l9z8WTOJMp7YJ4WXN5dLnsDNTH22NHk4hDrm3eriHlk0Tmpw6ZCjIuGZEiu.z3PAv7fJypQ
 FHOeXLiDx3E3BkJcIfHTn2sXYNssVc9KEdk8TYuMEhMzZ8fo8nLVb15YYXvgr.NNbvT_vAoxxhCW
 T_ZkHBshdcd4GHTzU2UlgBqjjtuB81JDxWEJZoMkqKew_5IdmUCZPhoAWLS8lgwHvBvHbfIFu_P.
 C3cO4CthzbWa2HhM9T9yioMGYz_kqj1oU1nglAf3sDYarS9RUzIR_5CNU3mnUtMHQL3aqS5GbKs_
 TOB7_MBEAz4O6MnOqEc.Uz3w9ONK2j40H5PJKEmrUGH_6AfoqXbnRU3OSjpKfxiOXOvxNZ6Ooa_F
 JLcw3ToELnG9U1RJ60VtsrTDgwDRD4Wr2xe3XdV0ynbCVfjAP.OiTeXFsmRR3.caepiHZjOIqpIw
 MwaNN2Rni87D6ydktsQpQI5KOolQYrCSzP.tf9__W4BLYzCPIN6hugJdnVR67K.rmiwsmklmaDSr
 T0J859mZRLP8vSbOdo.VMeetS.UsYKl4LYLGdI9.IAkMgCgmuUBkGSAjNlU7Frt2a_.ouS4_mA9K
 W4adMarT8NdFXNQI7Zw--
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Sat, 21 Jan 2023 18:19:16 +0000
Received: by hermes--production-bf1-6bb65c4965-7k2xj (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 933f982256ad66195c1bc98306f1939a; 
 Sat, 21 Jan 2023 18:06:42 +0000 (UTC)
Message-ID: <420b03de-3b1a-2096-529f-d18bfdf0cf53@aol.com>
Date: Sat, 21 Jan 2023 13:06:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>
 <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
 <Y7gqSLo8pMm4gfV+@perard.uk.xensource.com>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <Y7gqSLo8pMm4gfV+@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21096
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
Received-SPF: pass client-ip=98.137.69.205; envelope-from=brchuckz@aim.com;
 helo=sonic312-24.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/6/2023 9:03 AM, Anthony PERARD wrote:
> On Sun, Jan 01, 2023 at 06:52:03PM -0500, Chuck Zmudzinski wrote:
> > Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
> > as noted in docs/igd-assign.txt in the Qemu source code.
> > 
> > Currently, when the xl toolstack is used to configure a Xen HVM guest with
> > Intel IGD passthrough to the guest with the Qemu upstream device model,
> > a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
> > a different slot. This problem often prevents the guest from booting.
> > 
> > The only available workaround is not good: Configure Xen HVM guests to use
> > the old and no longer maintained Qemu traditional device model available
> > from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
> > 
> > To implement this feature in the Qemu upstream device model for Xen HVM
> > guests, introduce the following new functions, types, and macros:
> > 
> > * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
> > * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
> > * typedef XenPTQdevRealize function pointer
> > * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
> > * xen_igd_reserve_slot and xen_igd_clear_slot functions
> > 
> > The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
> > member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
> > the xl toolstack with the gfx_passthru option enabled, which sets the
> > igd-passthru=on option to Qemu for the Xen HVM machine type.
> > 
> > The new xen_igd_reserve_slot function also needs to be implemented in
> > hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
> > when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
> > in which case it does nothing.
> > 
> > The new xen_igd_clear_slot function overrides qdev->realize of the parent
> > PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
> > since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
> > created in hw/i386/pc_piix.c for the case when igd-passthru=on.
> > 
> > Move the call to xen_host_pci_device_get, and the associated error
> > handling, from xen_pt_realize to the new xen_igd_clear_slot function to
> > initialize the device class and vendor values which enables the checks for
> > the Intel IGD to succeed. The verification that the host device is an
> > Intel IGD to be passed through is done by checking the domain, bus, slot,
> > and function values as well as by checking that gfx_passthru is enabled,
> > the device class is VGA, and the device vendor in Intel.
> > 
> > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>
>
> This patch looks good enough. It only changes the "xenfv" machine so it
> doesn't prevent a proper fix to be done in the toolstack libxl.
>
> The change in xen_pci_passthrough_class_init() to try to run some code
> before pci_qdev_realize() could potentially break in the future due to
> been uncommon but hopefully that will be ok.
>
> So if no work to fix libxl appear soon, I'm ok with this patch:
>
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
>
> Thanks,
>

Hi Anthony,

If you have been following this patch it is now at v10. Since there is
another approach of patching libxl by using the "pc" machine instead of
patching Qemu to fix the "xenfv" machine and there have been other
changes, I did not include your Reviewed-by tag in the later versions.

I presume you are not interested in dealing with the technical debt
of patching libxl as proposed by this patch to libxl:

https://lore.kernel.org/xen-devel/20230110073201.mdUvSjy1vKtxPriqMQuWAxIjQzf1eAqIlZgal1u3GBI@z/

because it would be more difficult to maintain and result in reduced
startup performance with the Intel IGD than by patching Qemu and
fixing the "xenfv" machine type with the Intel IGD directly.

So are you OK with v10 of this patch? If so, you can add your Reviewed-by
again to v10. The v10 has several changes since v6 as requested by other
reviewers (Michael, Stefano, Igor).

The v10 of the patch is here:

https://lore.kernel.org/qemu-devel/d473914c4d2dc38ae87dca4b898d75b44751c9cb.1674297794.git.brchuckz@aol.com/

Thanks,

Chuck

