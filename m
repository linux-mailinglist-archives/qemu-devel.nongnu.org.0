Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EAA67FB3A
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 22:47:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLt1s-0004MB-Hk; Sat, 28 Jan 2023 16:46:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pLt1p-0004M1-CA
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 16:46:29 -0500
Received: from sonic304-25.consmr.mail.gq1.yahoo.com ([98.137.68.206])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pLt1l-0004p7-6F
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 16:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1674942381; bh=i/vr05TKD+F1m92FJqg44Xps5QK8VApWhvfxN+ciknA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=OcLtynQ26MC2DtWEFuL40nTQGzNHaPr+xDSeL0xGeJGg2WewlAlTLK07plUtxK6AkMd9ErZ02A9aJ9+vRJ6INWS553ajV8S9Kjg8WmM9e2orkqPzJAFoJv7w4DjpmSqakju46dyzOZ9zcXx33vbpJEq/eINwzYoYM0ekG2rOffn6to9mxrpTPpccCAPM7VYuUtEMtlbqAyrwTK+sTtMJ0vYRk1ePrIo8fOH3RpBZLJHqZIRGjF3ZReRr/XFz94JO94A8e6aJ7wN5rbC7YL4j9fIWDb/zqWZMgFA4JtYYkp7llzIjkiXAG8E2MN4JZxn3PNNZQYY//+LKKGa1+9GeCw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1674942381; bh=YkcRU2JLivOwcrBTKFzNvv5b4yoSlLUnAs3zk7mnG6c=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=dA9NNnsizConn5O+BFs6byqKUGjcUpssgz1VeApsQY+HNYfcvbSyXTsjben6jJxUONihIq0H18c4sGw+dQUoEDLLYnLu0uFLg4ZQPIlhiTNgkfhclZtBVLT21rG4zE+AnG/FOt0YQL/ccPgSv3eN+CGHLyNzp1A+W6RJ+2XxqjC8mVuwHG/YoCEDI5WQnCbd1ZmzP6lTI8qv2hDadtDwdXIMEAt3q5hGW13Z4s4tvHAkaPtsF9nA34+OxgExuH4uASJzbUzmcTh+cUSr1vyumYMv8L1aeGnfDS41Z3p7JKyS4miuS6u813JgCY8mlPreR2u3SxpJW2HL9oQD6vm1CQ==
X-YMail-OSG: 5k8WGQgVM1ljYvVah_k454SfTy6QByFHs.TQzy85jxzNQd1iNmSoiN4IMg334or
 HUO8a3FgBS0tx6Hc82zKyN2Ia2sAchkiUVIELdL1XYxXT9H5SZ.11hh9tMBDtF13mteMUeEgIAUU
 2ufmgE2qTvd4htiBoFVEPyzl3N2bQ0ZIZnKwAtE0.XLmaQr0JHcjK6Pm9c4_Wu4W5ykIVg77alYk
 YmVS5jMSLCjVroPAIssAxVL0FouCDr64RwB7xvHdBGbovk7kB7rw6Vk_GdpQqn9.dvtgjJzXFttO
 yg5XLbFJrkJNDmDP7FQSJbOrZpBZXY71qjk2YEPq.1xNqFgh6lxSZKd12ZDhKZJCNSVyREKF91rK
 WKIuP80obG_xEZUbIg_ddnZWLRlbSj0imgKPYyMfg6z998yxoiVLsROkNK.X9_5Wdwso8u8VCWE9
 oYPcjHRoIjM_YffXMKvucS.ZaSavg1tZezjZ.tgwhRRQsA9YuxLix3KvJ.npsSMdItuc9YmQUKzu
 z61jQRLULmUuz64xbKl9JFCgm_kTZLmBI6RoQ6SQvgYQI9Iwm2zphVYYRU5iF_m3z0PQyx7zp7RZ
 yi7l8MGECq6sWkTiRAlS17GLaw1KAVLYWKO._ytdIGVv_9XmgvBKTePjCxWRLjfTbwyOdlWDoA5w
 JkctUh.OVYssYzw1N9futiq09bDLU1WI6lq_jZ3Ld2HFx9_dnHOFMddOyq9Rgn5hFYAFpwnSZgry
 4cibPwZxbp6kOebSBLJ6qud2RnJBVQRDqP9DouQUm5q7qLOjE1IKTl7vbAz0OoPwDTTZGHXl1jl6
 q7jTHbbYpvfPNBjrXVDfcgWuIy4UiLYmOa7.gahWlbzIUS3rywiwkZme77TNAJfitYhS_5Uou_g0
 1DPzptgIbmHKb7DXvTKPAkSGedT1ZBMBm65tsus5zGL2c8d_u4F3ntMlwC4mMetvPP7u70hqKpBK
 FDwU.uRgDxwpZQmn0LzblvQWcM8QDbLgqokv9Ax9HBVAltesYmNp9vpAw27z.Q7GlRJdzPEGdP1a
 9pMNmWEANhIKj3A4ArCPUPtSss4Z1Cqc4l.3pMuI.TxWHwxNWRO2fYpxFATrtI.q5een5T3zrxC3
 _p5GABStKG0_Sp_u8rk0ibdoElarCn_yLsoAckG7Zk8CFBBfZiSSfcheMiKDBZo8zAjIasRNandv
 T50a9wSr0Lq__15qli72oYR2SUTjPjzAkMFyKBh_EeanOeVe3.4HOckJnB3_JeEHZkFhXbN0bNDB
 NHeDEd3clM.ztepVKSCjrNU0S0qnfLAeS26muxaPGzP2hTmU_MGwpBmTHzHLRfVwebwBRK6ekGWI
 qCg34gcR075Zg2xWpq60308CnoPjfUCOd1189dfiaN.Fqiop5.wWKX4nRB57JSm7cmPqMDklf8Uh
 g42MOGRszoa8EIDCnCWMKuWRzel6rHR9Z.IlVl4Z3ONHOFiszad6beFzmj5ktjUvNVU_npwsbLGT
 wjfsBWoWB7_rYmWAhk6WoUyySXCrWjf9T5eTADumK908vtoXJB4x7eKQICtF3yMrE8uec0twJjU4
 NfBNJsgLvj0WkDdu_Ekt9pxX0iYNdoKjO4lMdZj05DovOO8XwKgKUKn1trlkiJkXn2KJn1RRkc9b
 5YnO3HgNyothZnw88XLGbkSIQmNFyazUT_x7YwF98MJ3djnaLF8m3sF5.HhihMp4XtP77mLzXMKC
 BnsDGhC6hLpc8AEJduWSJO8BfK5nq3YBY_duaYdKTSE1s1rzDnlAMS6I7dLn2Yg7uSCgRjHw0N.b
 siZXOC7rshjOFMkxTsy0p4eG_.ERrSXRhTUAbBd0seFyL1ckvm.Fm6JqilCz0KE3NqpVmrsEx9A.
 TCX4AQNIXpqLISCdVmrZ_N1o82o0GE1gpUOGG6S07OmW16JpMCM1JrafKD6wQOnwnP8H5g12WVUy
 MGzpiSuiS.GFdxaRmWODmlg23KsPAhH3OnLvlfPaGJASHX5AAnejfDbuQDhz7bYCatOz4eG_rEVm
 1dgRno3il4AJqS3etKpG5lOTU1VhkdUbzehy8S2uZWqsfls1g5Qa30UVm3dUsJc5oNRj_XxjMz.E
 dxFPuddmpKJo0v2F.Fht_eEIyIAVfPzTIJY6FrU3a7sDDegZWfH2Aq8he3AUyxPYyxfogNyyytIw
 _W6SXdqdXsBpdUBoJFiGRsLoO0ejhyFHnorclPQz_9uQnLNTFM4wvSEa_zbA0GIoFlz_HKGFe8py
 XnW8m_gXr2a8-
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.gq1.yahoo.com with HTTP; Sat, 28 Jan 2023 21:46:21 +0000
Received: by hermes--production-ne1-746bc6c6c4-kcw5g (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID d2adb4894d8f57662023d7714c043abe; 
 Sat, 28 Jan 2023 21:46:18 +0000 (UTC)
Message-ID: <11f61b6b-df71-d3f2-d01d-1b4101b9126f@aol.com>
Date: Sat, 28 Jan 2023 16:46:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] pci: add enforce_slot_reserved_mask_manual property
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Daniel P. Berrange"
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz.ref@aol.com>
 <ad5f5cf8bc4bd4a720724ed41e47565a7f27adf5.1673829387.git.brchuckz@aol.com>
 <20230127082240-mutt-send-email-mst@kernel.org>
 <ddac019e-28bc-9e0b-c6d7-5bd54d0239f3@aol.com>
 <20230128052506-mutt-send-email-mst@kernel.org>
 <56643500-7bdd-8204-0529-fa004ab10a44@aol.com>
 <20230128141348-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230128141348-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21123
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
Received-SPF: pass client-ip=98.137.68.206; envelope-from=brchuckz@aim.com;
 helo=sonic304-25.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.15,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/28/23 2:14 PM, Michael S. Tsirkin wrote:
> On Sat, Jan 28, 2023 at 08:20:55AM -0500, Chuck Zmudzinski wrote:
>> On 1/28/23 5:26 AM, Michael S. Tsirkin wrote:
>> > On Fri, Jan 27, 2023 at 10:39:28PM -0500, Chuck Zmudzinski wrote:
>> >> On 1/27/2023 8:28 AM, Michael S. Tsirkin wrote:
>> >> > On Sun, Jan 15, 2023 at 07:49:51PM -0500, Chuck Zmudzinski wrote:
>> >> > > The current reserved slot check in do_pci_register_device(), added with
>> >> > > commit 8b8849844fd6
>> >> >
>> >> > add ("subject here") please
>> >> >
>> >> > > ,is done even if the pci device being added is
>> >> > > configured manually for a particular slot. The new property, when set
>> >> > > to false, disables the check when the device is configured to request a
>> >> > > particular slot. This allows an administrator or management tool to
>> >> > > override slot_reserved_mask for a pci device by requesting a particular
>> >> > > slot for the device. The new property is initialized to true which
>> >> > > preserves the existing behavior of slot_reserved_mask by default.
>> >> > > 
>> >> > > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>> >> >
>> >> > Thanks!
>> >> > I'm trying to think of the best default for this.
>> >> 
>> >> I think it would be better for the default value of
>> >> enforce_slot_reserved_mask_manual to be false, so that a
>> >> user-specified slot will by default override slot_reserved_mask.
>> >> But doing that would change the current behavior of
>> >> slot_reserved_mask.
>> >> 
>> >> Currently, this is the only place where slot_reserved_mask is used in all
>> >> of the Qemu source (code from hw/sparc64/sun4u.c):
>> >> 
>> >> ------ snip -------
>> >>     /* Only in-built Simba APBs can exist on the root bus, slot 0 on busA is
>> >>        reserved (leaving no slots free after on-board devices) however slots
>> >>        0-3 are free on busB */
>> >>     pci_bus->slot_reserved_mask = 0xfffffffc;
>> >>     pci_busA->slot_reserved_mask = 0xfffffff1;
>> >>     pci_busB->slot_reserved_mask = 0xfffffff0;
>> >> ------ snip -------
>> >> 
>> >> I think we could safely change the default value of
>> >> enforce_slot_reserved_mask_manual to false but set
>> >> it to true for the sparc64 sun4u board here to preserve
>> >> the current behavior of the only existing board in Qemu
>> >> that uses slot_reserved_mask.
>> >> 
>> >> What do you think?
>> > 
>> > I guess first can you answer whether this is still needed
>> > with the latest Xen patches?
>> > 
>> 
>> It's not really needed except for experimental purposes to allow
>> an administrator to test experimental configurations with a device
>> other than the igd at slot 2. That might be useful in some cases,
>> but it is not really necessary unless someone asks for that capability.
>> If libvirt users who ordinarily like to manually specify all the
>> settings will be OK with the proposed patch to xen that prevents
>> an administrator from being able to override a new setting that
>> reserves slot 2 for the igd for type "xenfv" machines configured for
>> igd passthrough, then there is no need for this patch. I don't think
>> many users need the capability to insert a different device in slot 2 for
>> the "xenfv" machine type configured with igd-passthru=on, so I would be
>> OK if this patch is not included in qemu.
>> 
>> Chuck
> 
> Pls wait and see if that patch gets picked up. Let me know.
> 

A day or two ago Anthony said he would look at the xen patch soon. So we'll
just wait for him, and I'll let you know if he is going to pull it up.

