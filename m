Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976D86525BA
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 18:46:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7fZz-0005xb-96; Tue, 20 Dec 2022 11:35:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+3d4d80a81840c180149e+7058+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p7fZi-0005uW-Fw
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 11:34:42 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+3d4d80a81840c180149e+7058+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p7fZZ-0004aK-GD
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 11:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=jVgazt+dmJ/3WOBapuF0GiZZREIVytzfoahHpaa4MNs=; b=XFJmnnqhrk+ZqW73IPjEMbSJ9j
 n5bNHqgkNCca6e8wrDRG5FkFVTmhlTRl5Cf9o3PSHya+onflXehq4rkGzy9ohqCiYJNDash54+y6+
 1oXksPUqYuGWZvGDDs1ascYr/3x64FbxSjW3rodioVG7iqwsuilafGN26SyjlH3H7QlPhhhP8cS4m
 2IkdeYahf4TVn1djcGJSyonVWQ6lKFwupJlkIP2xK1l0PvDVHI95SIQxA9bqRT58Y52kUkddXGXMO
 7WhboCOrRHA44KnBwNKSFzKsDAMb3EL1ncB/piTKGf7LZujdmOGee5vj1RlavzsHyNkkKo9g2byzb
 GJ8y/dCw==;
Received: from [109.144.17.74] (helo=[127.0.0.1])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p7fUy-001y0j-3g; Tue, 20 Dec 2022 16:29:48 +0000
Date: Tue, 20 Dec 2022 16:29:36 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: paul@xen.org, Paul Durrant <xadimgnik@gmail.com>, qemu-devel@nongnu.org
CC: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>, 
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_v3_07/38=5D_xen-platform=3A_?=
 =?US-ASCII?Q?allow_its_creation_with_XEN=5FEMULATE_mode?=
User-Agent: K-9 Mail for Android
In-Reply-To: <6e5ab37f-4797-70f1-7e49-d1699af2a425@xen.org>
References: <20221216004117.862106-1-dwmw2@infradead.org>
 <20221216004117.862106-8-dwmw2@infradead.org>
 <6e5ab37f-4797-70f1-7e49-d1699af2a425@xen.org>
Message-ID: <09035118-6DB1-47D3-AC0E-9AB5FF802D21@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+3d4d80a81840c180149e+7058+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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



On 20 December 2022 16:19:54 GMT, Paul Durrant <xadimgnik@gmail=2Ecom> wro=
te:
>On 16/12/2022 00:40, David Woodhouse wrote:
>> From: Joao Martins <joao=2Em=2Emartins@oracle=2Ecom>
>>=20
>> The only thing we need to handle on KVM side is to change the
>> pfn from R/W to R/O=2E
>>=20
>> Signed-off-by: Joao Martins <joao=2Em=2Emartins@oracle=2Ecom>
>> Signed-off-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>> ---
>>   hw/i386/xen/xen_platform=2Ec | 11 ++++-------
>>   1 file changed, 4 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/hw/i386/xen/xen_platform=2Ec b/hw/i386/xen/xen_platform=2E=
c
>> index a6f0fb478a=2E=2E15d5ae7c69 100644
>> --- a/hw/i386/xen/xen_platform=2Ec
>> +++ b/hw/i386/xen/xen_platform=2Ec
>> @@ -283,7 +283,10 @@ static void platform_fixed_ioport_writeb(void *opa=
que, uint32_t addr, uint32_t v
>>       case 0: /* Platform flags */ {
>>           hvmmem_type_t mem_type =3D (val & PFFLAG_ROM_LOCK) ?
>>               HVMMEM_ram_ro : HVMMEM_ram_rw;
>> -        if (xen_set_mem_type(xen_domid, mem_type, 0xc0, 0x40)) {
>> +        if (xen_mode =3D=3D XEN_EMULATE) {
>> +            /* XXX */
>
>???

Needs to mess with the q35/i440gx pam_update() I think=2E

