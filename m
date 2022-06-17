Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 555A354FF62
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 23:32:30 +0200 (CEST)
Received: from localhost ([::1]:38100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2JZt-0007d6-6C
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 17:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1o2Hb4-0004lq-Ur
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 15:25:38 -0400
Received: from sonic316-54.consmr.mail.gq1.yahoo.com ([98.137.69.30]:45352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1o2Hb2-0004Td-Hn
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 15:25:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048;
 t=1655493930; bh=vlcQCj9UTfubRdysfbCKFBRm8+4ciyYN0AmNZyeI72E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=W64Hyk0KdhYnX9eXyT8dkHrcfb1X5XZv8AEebzrnxObyxENzQd9OIgAO4PkNtn3wQBrRRMhQkVNtPlSyzi/4S+lnxxvgTvW+UfOdKK0RgY3JeqeKBguqiBPq9mkCKQ0fheaFk26ItpBqkHL8sszGW8YQ4uljRJ9ohpx8YV8m/khgVTBt/tUV8Bub/w0jB+jYRQxeMS1iwrJQJ/kCxKJdsca4OuecVjfExkj6B7UoC1juTbgsBZXP3MNKV3Ck1Fky03zv6pzojaIGHagcMbwydJJLeeKejyzjrTI/Oay/weoj95rHxGQF7uRRbIFHmkwZ9KpTLtcT/5s9atF/6QNy1g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1655493930; bh=qNjS/Va1GoI+ySU9xTMv+RsojFuWBUgo1wrTLH0W6Vs=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=Es6T2TayzTooeK/TnHPFo8rXiTQUGjG2tDGzDEqXwGQnjpU73Vq9HBZNX3a/uKnQrapPVLG5GwY8DXZFQyhBAfpyuCCap373EKRufPHwVjnsyn91c5uWoGUkkNNOoLg861tBMlC1ri2iCr6K62w0CxfUjXuQshzqxVoIq4Ar6qi+J8nuw5AQVkfKKfKOzcl4ZKhs0tDBz57Br1Unhtf5EW546UKiJJ0UG0FX3jcXjEYEcUSrmAK8H3wuqcivrfy2cQWDOZw1qUFZpSZ4yxw2bqehuRP9AD5I5xPJw6wuaso6h47PlP1ykGyfijXZtC5+gBw0lh8J+CpDOrnfeJVU/Q==
X-YMail-OSG: 8g2H05QVM1nOwZscjg4ZJammOfHkIfN3ZZ6OZuNaC42ui4CQlRdSNH5Y4XZuTRr
 Tx5uiohXqqP.4gxpF6vLw0XO3mSP_NO_YwGtBH2rMGHE0GtTBpbYG1tFXuDk1lt6cIfRHxo62Jp0
 aQpASMlIHe.J2gpkpqNlFyzcNKuqPMDcC85J2i73Pc7Sms9hG.eTGFcnVPkM8IEHmagqhqmwjqFc
 y1pkUWsr4Wkl8Jap4.NUt6GCVfkmVRQvD6cDC_h1z3YRjoYRKdzPYVFDtAlFXyNqEpLQ6Eug.nPu
 FDdUJtHYxSLmUv1adccIl8hu3AjINPI2UkFcaPtKDHrmtdR4TiziXzmt8W9B5y_Qiodv0k2.ZCOd
 .zpcQBlpkTnvG3hWtUkMMA_N12KiNYmuOnAGJh_frFTWHUs3XtL4dkDPfeywu3Z3SGMhLWNxMRB.
 7Zl6PmyYV3Kbv0vrXyrf93nTvQO.xHuJ7jHl57tSRcguczjZx.1FjdPEuk4cVLqZrCqLVytaw6Qn
 v65OuttbLHE4frViHxInC6_dURYnZuxxu1ikhUJ7aRbWJY83KUvaUibnvpBtpK0gtGkYeaFjQpxx
 VR9J0A4.zs.P7Hle.2lYoaLIlBUGaq0vxi873dJUfW0zoxllY7QBKhKpOPyIG_qr6PJRJ3gAVOBP
 BdMeTzw8.toDi_uZ9Bm8oYU_5Vu7BIdWLD3KG7j2lleyK4xt73XIIGIF7VOZMjhT8AdZa8QSvkb9
 AFV3RsVvsJUYj5AYMPNCcVlhKEcyTzZgBVOaEweEliWY196Tq71MQGksHwfJ6kCn9TUJVAirDy5Z
 pHHasKn_3m7N1wtq54PSB.pCSgIU.0qUkRwfhs_H4LZ_y7Ub5GFcxRY_NBwi78emUNyAbjPl5BQm
 MrmCXAaLuC8nQNUFLF5LW_GI8Zim_RdszAVH.U5VfAoT4Hbb2zz.0QWdD4oQR9jsO_z0bQnZPJNq
 Pufpqb9CF675czz0GgV4uYBXpjkuZQtoSN6RMiQ00QFGwaLdi0WcOpNft7P7ZrnLU0Vh5.fU_Pfg
 m07_pJJ8Lhe87vhwpi7JMEgBxfhqdoCT.e9rmHYk8b6S8u9GCZa92wXW4FJH2nfTMwsfcaGS5alx
 V4BR8QEuAGHq7UNQvWsnhTtu1PIlQyYGvr_mknCRO2TNiiN3.6D9WyPNn_fvquqB3VSAP5Hkljwc
 U8emc0tnAxKmb8TVYY3sPl8IpB1qjIvitBJ5nzAqwWRB4D7mz_2yuvuCznt.Tl2fEQU9uc7BYkRV
 jSs2q6BIk8FcABySKuMhnvDrxWwxAwtrSLV6MHBKKsoqNoKLt6AciTcOtb3yPZUJjpf2mxYpbrbj
 sXA3YgXEe.J3K1pcq8Es94ijnHufjh34e8nfLFlKDQy0LrOwGpEOsQbBuIPY7vU79L_ulmsPNusK
 LWiutpmNJeIt0QW4iBpF8_FFLlpyYR7.oQ0McGCg0ksk2d1ypF2zi3V0uKzwjh3XIoGg3YUKzbta
 IuK4hDSlkNddQhE1u9EGXZ9rRsx_CW499xfxEw1w3HOQVBoPkbKeXIOb9LGdpYlD5mH69_EA7LUZ
 n5GbCe.xjve1sX19h7mAaVo55huC_27w3Zi8qajh3zo10h5fJ.zwamWoA4iPQCUAlyckNID1s29J
 GWm17gh1D6sd1t1kmVXErVD105PHE5imSOb0pAOaahK78Q_v3f6M3siFQODxjaHs4t6E6CW5Pl3z
 84w9.JdAp.Nv6d3KrY205XOFhKYfJKLtpDS1p5TR0L.SiuCt6SWCudrnC8NxyG7wwiYNQljFxXxJ
 7.ytMcnivJyY7IzfBgtZ0pHAT6Gie9yjKzPBZXqSiUi3yzC5RXUCQ.TsKuVo9YvMY5hnSutLFjm.
 WKygxDVi3kBZN1.5b2dRXzC7sYT0yYLZEtpXvAVz.iayioMZazqd8UHRsrYQvUjYx2gIxDCaso1m
 cp6jKTb.MRyqmrQrs9jQ2xvSyafQTMvmue56WWJKkU85QTguKsrmaJOk6B7yLaV_G19MbdZLVQO_
 R1RCESAk3H5QRa0CdxKKhj5gf93a2Sa9RydT5NTiEp13Ze3ouiIml8DR7YR.m59jmECuEVolxa8g
 73UTBmDY16JqUi7aL8.v3B4_XbyY5Nhefc7PF_i9IuzJFDP.cazDG.wpzIQqHYrGIlM.h1txA1kb
 JLmgpRltGFgmLKco7IPcb1FszlNgjaV3MCSGS0FiVwvQr97Le5TJ75jDKcAKGc6SpD_dKO9RFcNw
 8.XryB.FFbJQ7QxhtXXU1
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Fri, 17 Jun 2022 19:25:30 +0000
Received: by hermes--canary-production-bf1-8bb76d6cf-7lzpt (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID 53c15538f9520d4ca7add3ad628bdd99; 
 Fri, 17 Jun 2022 19:25:27 +0000 (UTC)
Message-ID: <40ffbdbb-6af7-5ab0-7065-db5c0e718ed5@netscape.net>
Date: Fri, 17 Jun 2022 15:25:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/pass-through: don't create needless register group
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
 qemu-trivial@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>
References: <a2e946dfb45260a5e29cec3b2195e4c1385b0d63.1654876622.git.brchuckz.ref@aol.com>
 <a2e946dfb45260a5e29cec3b2195e4c1385b0d63.1654876622.git.brchuckz@aol.com>
 <Yqx8ht2teAoRJF4b@perard.uk.xensource.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <Yqx8ht2teAoRJF4b@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20280
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
Received-SPF: pass client-ip=98.137.69.30; envelope-from=brchuckz@aim.com;
 helo=sonic316-54.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 17 Jun 2022 17:30:23 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/22 9:07 AM, Anthony PERARD wrote:
> On Fri, Jun 10, 2022 at 12:23:35PM -0400, Chuck Zmudzinski wrote:
>> Currently we are creating a register group for the Intel IGD OpRegion
>> for every device we pass through, but the XEN_PCI_INTEL_OPREGION
>> register group is only valid for an Intel IGD. Add a check to make
>> sure the device is an Intel IGD and a check that the administrator has
>> enabled gfx_passthru in the xl domain configuration. Require both checks
>> to be true before creating the register group. Use the existing
>> is_igd_vga_passthrough() function to check for a graphics device from
>> any vendor and that the administrator enabled gfx_passthru in the xl
>> domain configuration, but further require that the vendor be Intel,
>> because only Intel IGD devices have an Intel OpRegion. These are the
>> same checks hvmloader and libxl do to determine if the Intel OpRegion
>> needs to be mapped into the guest's memory.
>>
>> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>> ---
>>   hw/xen/xen_pt_config_init.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
>> index c5c4e943a8..ffd915654c 100644
>> --- a/hw/xen/xen_pt_config_init.c
>> +++ b/hw/xen/xen_pt_config_init.c
>> @@ -2037,6 +2037,10 @@ void xen_pt_config_init(XenPCIPassthroughState *s, Error **errp)
>>            * therefore the size should be 0xff.
>>            */
> Could you move that comment? I think it would make more sense to comment
> the "reg_grp_offset=XEN_PCI_INTEL_OPREGION" line now that the `if` block
> also skip setting up the group on non-intel devices.

OK. I just e-mailed interested parties v2 that moves the comment
and mentions that the comment is moved in the commit message.

Best Regards,

Chuck

>
>>           if (xen_pt_emu_reg_grps[i].grp_id == XEN_PCI_INTEL_OPREGION) {
>> +            if (!is_igd_vga_passthrough(&s->real_device) ||
>> +                s->real_device.vendor_id != PCI_VENDOR_ID_INTEL) {
>> +                continue;
>> +            }
>>               reg_grp_offset = XEN_PCI_INTEL_OPREGION;
>>           }
> Thanks,
>


