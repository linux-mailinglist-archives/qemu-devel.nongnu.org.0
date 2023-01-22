Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFC0676A87
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 02:10:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJOrS-00056o-Ol; Sat, 21 Jan 2023 20:09:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pJOrQ-00056X-Cz
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 20:09:28 -0500
Received: from sonic307-8.consmr.mail.gq1.yahoo.com ([98.137.64.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pJOrN-0000XE-V1
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 20:09:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1674349762; bh=L1csov0r2CmZQLOHK3aR9bs3iEEnaMvslHlCsvNCLEQ=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To;
 b=Rh447vHBPFk3FTy7+JrwHcrkBnLv8g6ndEzxAW+Q4lvSE5hDuCvM03C780bfPl0mHCRQw80iyNSVhxYMvRJ46glLgpskJvWa/sCcV1bgfENTcsS+TPhdowGuJOLhcbX2Qn/kkrdQFQsF/QWbQOiUVXdpiQkb/EqpvGMcg6of9u7KCpZFSuxufWL3jiyTQaLsnY+fUSmO8tw3F5v13lAdTbalMhEXjd0/72usEty1BKMJ53BZAbsISrUaMSptjwqB6zp7QII1k+L+BZI7Fdyoql0Q5P04+ECGUuJK9VSywubFw0hw6R6st8yUEEZ5AMdfytBe6/fIsfWfKY0Mib484w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1674349762; bh=yhEbEC+t/nsi70836EWgS9QUyl2cLusDAIseBN/T3zR=;
 h=X-Sonic-MF:Date:Subject:From:To:From:Subject;
 b=WLL+FxI6CM8C3eWYkARtZJ/lkXJoNjXeG+ez616UHWzG8r/beeUoAvr3FrPSDov6hUyT3uV9QsbcwLz4dyJKcqzlIpwQMbQled1ozeImAIHQlpnH8ycv5dsIZFu7/RgJRYKvNW2XHlQpFjeLI/hnTj8eHumcatUn8xVL9FnJv/CcMGmWucPE4BzXwGCEFnswZkR72tSi/pgpilFWuhssIfuHAN835jla753WkvwBRMtnnrYKg7JtqE5pMGTaNXVF/46se2kqyxql3ouvlLs8pSKlxMJ6y4JJCG7QKrn1yNRqaBe4OAaArf7/Oy7LyByqXPhDwO4SaZtQagoLmWTodA==
X-YMail-OSG: WR37BekVM1nb_s_Q6DZ4ROYFM_XftDNooitMZlYE8VXoIbzH1VV.jdC83Y3.qSi
 rloauWJcLeMcJb2Yin2iMAGyokqLo0DlkNDFRZhQ5vxHyJxmRDPH2o53ZrMyZv41iAZ83lXCGUps
 Rv05vskVBPH92Ips2hMe.HaMDmhbXBzEZJOPs.1aS9XPpZ_tz5Vr.kmEjnRudj2cXpw_op3e2NxD
 njgvH9al093Yc4lu1R2XFf7gHoKKJ1_p6a4.dcgHWCr_yBG8.LtXpfU8Ia3hE0RSFaX.qvSmRvch
 u_SFvGVmY9aRHq7Fbg7.RavswtpRgGO1TAUFJGws5tQAE3sSPfkRi7naeWmwBYMcQbU.N5Hr82Jl
 mGqTjGSMqmjJdw9OwiwRygarVOMIXyLlizZrDoqzlWGU9nCNn9i3.xdMKK9Mdl782vA2ZAEg_ix2
 m7rcaAt8YWTS5IY8FMVHvmGp6AqwHjJthw6BBBTf5yHeiLDBkjQoLCdM11gQ.eNdoTXFsSqVCIzk
 HgLtNJeeJzMTlDlgRCJcusKu0UqPoiH7aV.nMdbGlnMRN.Nwk9QkgnD9Blq0nfX2.OxtQuhb6FbP
 wVlvyRZb5oCgnNqCyoFjxHAoF5zQHNEQdir27mZvYHWZ5o3iDPW3IB2YaX5AqNV_pSV8MS28HV4N
 b8vLdq4a9FbRITt4d3pJTHAAlJf_MH.x9YIQpshNkAeHpr8Ro1c858LTxufMmwqc2hySdmWzHVcx
 PDgLrEbKk09MSlSWSIJQ9215sLcG1qf8PWmz.3HPK6hKjpY_sLvIB1tFDDLCQh.eLFx.F9zWMdzL
 iygxuhTsZ7VPwYgaSwznUyzejY1WB1c6_MWwhR0N0jdzo_7FugAg6oABDXVht1CJjCdEYl3yMPX3
 dtLsvYe9E4YvZgSSgPSnOUhPSMvrLkDl6wNyPa9MDt4JvPEvoCOUXsOpBhkXwyRxPKe1aJVEw_UF
 NU8vrunz22UK.OWN9rccVNLXE0qWE4MS9ZTQyawAdPVTjAk5kSoXYq1lLo59LmMCE.GxrLQXD2qu
 Qyi.qIWN6D.17rkuHoX6vjSNPGrKGJkdnt46N6DmfFP4M2ourIGyMnpNQ1hp4wsCwL.hvDdWXRC3
 WnC0cnObqEh2bqh4gjJM7zS.BqgAYlbmCKs9N.iFj3drezWPYxjsT5K.LdSgLKH3jpiCSwBcHyZd
 OZhehZ7vSLyTOrWllfJ.aD_xx_YosV.kZ95ySPH7RQRs8Axtc2YO303DhqGNdqZYGuxq1umrMvhE
 hFOtzIikh54K8xBOMZ0e3nNfTTktSk6ygYtE0A_feWpcTI4gSTjaE9TarpCKaQfusdCZcALy2NK2
 q6gC2pi8xYMzH3vVapqaTKiGu0q035Zu86A0LSSfdr0MB._zvaq8zjH8Y_p_hnHQONyIC2iNifrd
 yAYHQnsdR_WxEGsfdRMSTJg9Leuu8K4heYsrMVNBVB7ADcWv_H3AV3LnkNdNQJlXai1Lr4xBq74I
 chUS9USvW6gHAo5Z0POWf2cby71GeHsud4atJwHYUgF2bODBH1gq9IY36F_XBlDpjgkc7YsxhRgU
 jKQFnfaTmOOPatppstHHyiWJ2TJE5fj9..haZEkkYLfo8ye7oLtdpY_XTv6QrQCl2aGTnTsj2z.p
 gJ.NyLkq7mxJcMbj0a5SAvz2qmTuMhNDmbEiJTTQgktc5wV9crox2rxJIntdGZpynNW60jV04j6.
 .6pFaf.gmxIA9lzhrF4SJFuMCulbpnEnV4p7dXT5BXHROf38dFF5T.JxPwhOc_dgLFONjdYl.lK.
 a3Do4gN15fGp4zqEmvehQ6ve9PJRRp7eX_XfhNIuGNcX1EdzQV8Kq8SxaorLGoEJjzUC7AzZDOMV
 I6RdR4T1UKEg.KzUTMRzCjfytLvtLkJIAakp8QCoP_xO1xjoOIjDnskDm_PN9Dz2GGznz8WtKpXn
 cF008XhXlf9e4Qy2RrTBCY93afAGR7zO1GBKmBYUVkLSfYOMwE3ZULhBF5gOuZfuYrnfuCMmdIIH
 gCYH448Kl5d.jeJDprFOaPEhtN5s7DSKcXkVacQ0SW5QW5cy0BXT0dK9i19_RKoNHSQyZ1OuHhcW
 CCh2MRMybG1E0Z5CJGVK8uz6nSkzZiFFfqJQHtXttK6I4xJqWanX7RMm5zkWWO7wDS9psmbSeNqh
 TgAJyQLeNAyhP3OWd4Dty8yMHk19lt8KErG8ky9oCp_cpbo839dC_AO6pa6uJwX791zHRNrAch26
 MifMnTg.67dg-
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.gq1.yahoo.com with HTTP; Sun, 22 Jan 2023 01:09:22 +0000
Received: by hermes--production-ne1-749986b79f-29jwl (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 72821de4fdb96083f42679ac48af847f; 
 Sun, 22 Jan 2023 01:09:16 +0000 (UTC)
Message-ID: <71bde2bc-ee04-7213-ce93-18e0a6188a03@aol.com>
Date: Sat, 21 Jan 2023 20:09:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>
 <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
 <Y7gqSLo8pMm4gfV+@perard.uk.xensource.com>
 <420b03de-3b1a-2096-529f-d18bfdf0cf53@aol.com>
In-Reply-To: <420b03de-3b1a-2096-529f-d18bfdf0cf53@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21096
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
Received-SPF: pass client-ip=98.137.64.32; envelope-from=brchuckz@aim.com;
 helo=sonic307-8.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 1/21/23 1:06 PM, Chuck Zmudzinski wrote:
> On 1/6/2023 9:03 AM, Anthony PERARD wrote:
>> On Sun, Jan 01, 2023 at 06:52:03PM -0500, Chuck Zmudzinski wrote:
>> > Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
>> > as noted in docs/igd-assign.txt in the Qemu source code.
>> > 
>> > Currently, when the xl toolstack is used to configure a Xen HVM guest with
>> > Intel IGD passthrough to the guest with the Qemu upstream device model,
>> > a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
>> > a different slot. This problem often prevents the guest from booting.
>> > 
>> > The only available workaround is not good: Configure Xen HVM guests to use
>> > the old and no longer maintained Qemu traditional device model available
>> > from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
>> > 
>> > To implement this feature in the Qemu upstream device model for Xen HVM
>> > guests, introduce the following new functions, types, and macros:
>> > 
>> > * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
>> > * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
>> > * typedef XenPTQdevRealize function pointer
>> > * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
>> > * xen_igd_reserve_slot and xen_igd_clear_slot functions
>> > 
>> > The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
>> > member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
>> > the xl toolstack with the gfx_passthru option enabled, which sets the
>> > igd-passthru=on option to Qemu for the Xen HVM machine type.
>> > 
>> > The new xen_igd_reserve_slot function also needs to be implemented in
>> > hw/xen/xen_pt_stub.c to prevent FTBFS during the link stage for the case
>> > when Qemu is configured with --enable-xen and --disable-xen-pci-passthrough,
>> > in which case it does nothing.
>> > 
>> > The new xen_igd_clear_slot function overrides qdev->realize of the parent
>> > PCI device class to enable the Intel IGD to occupy slot 2 on the PCI bus
>> > since slot 2 was reserved by xen_igd_reserve_slot when the PCI bus was
>> > created in hw/i386/pc_piix.c for the case when igd-passthru=on.
>> > 
>> > Move the call to xen_host_pci_device_get, and the associated error
>> > handling, from xen_pt_realize to the new xen_igd_clear_slot function to
>> > initialize the device class and vendor values which enables the checks for
>> > the Intel IGD to succeed. The verification that the host device is an
>> > Intel IGD to be passed through is done by checking the domain, bus, slot,
>> > and function values as well as by checking that gfx_passthru is enabled,
>> > the device class is VGA, and the device vendor in Intel.
>> > 
>> > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>>
>>
>> This patch looks good enough. It only changes the "xenfv" machine so it
>> doesn't prevent a proper fix to be done in the toolstack libxl.
>>
>> The change in xen_pci_passthrough_class_init() to try to run some code
>> before pci_qdev_realize() could potentially break in the future due to
>> been uncommon but hopefully that will be ok.
>>
>> So if no work to fix libxl appear soon, I'm ok with this patch:
>>
>> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
>>
>> Thanks,
>>
> 
> Hi Anthony,
> 
> If you have been following this patch it is now at v10. Since there is
> another approach of patching libxl by using the "pc" machine instead of
> patching Qemu to fix the "xenfv" machine and there have been other
> changes, I did not include your Reviewed-by tag in the later versions.
> 
> I presume you are not interested in dealing with the technical debt
> of patching libxl as proposed by this patch to libxl:
> 
> https://lore.kernel.org/xen-devel/20230110073201.mdUvSjy1vKtxPriqMQuWAxIjQzf1eAqIlZgal1u3GBI@z/
> 
> because it would be more difficult to maintain and result in reduced
> startup performance with the Intel IGD than by patching Qemu and
> fixing the "xenfv" machine type with the Intel IGD directly.
> 
> So are you OK with v10 of this patch? If so, you can add your Reviewed-by
> again to v10. The v10 has several changes since v6 as requested by other
> reviewers (Michael, Stefano, Igor).
> 
> The v10 of the patch is here:
> 
> https://lore.kernel.org/qemu-devel/d473914c4d2dc38ae87dca4b898d75b44751c9cb.1674297794.git.brchuckz@aol.com/
> 
> Thanks,
> 
> Chuck

Sorry to bother you again, Anthony, but no one noticed a style
mistake that has been present in the past few versions. The
v11 fixes that without making any other changes since v10, so
if you want to add your Reviewed-by to the most recent version,
here it is (v11) (you should also have it in your Inbox):

https://lore.kernel.org/qemu-devel/b1b4a21fe9a600b1322742dda55a40e9961daa57.1674346505.git.brchuckz@aol.com/

Thanks,

Chuck

