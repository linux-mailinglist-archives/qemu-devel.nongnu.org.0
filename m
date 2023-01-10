Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8AF66360E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 01:08:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF2B2-0005AM-5t; Mon, 09 Jan 2023 19:07:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pF2Az-00059Z-BC
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 19:07:37 -0500
Received: from sonic306-21.consmr.mail.gq1.yahoo.com ([98.137.68.84])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pF2Ax-00067W-Dn
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 19:07:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1673309252; bh=TjWRQ3XDQ9v5XBbBlXFg/nqc2AKrVM/5dbL4mDfhkpE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=JfA1QQc4IuZWn2q/0AwE8zlAE1hfXOHaXiKe8imLX/Ytrn4nLV2TMHnnMkwQdVJW5c5/zbVtxlJQtkCxzG2sE5Jv63uwlrk3/DuZF98BZAJvAAwEAbECmD/4YPsk8ksSaZHtDPIPFzbv5Twlt9GiZR0A1iOMElk5nd9SC1XiicMc06sGIcj9DdM/njYUzgbx4/8D8OL3nT9JPPp/o3YbFuxUcsTFX7oKyXe7AZL39bL7gRx+Xl5YhUbV6sQFPPCdovcfKeAiBd2ZAO8sCaMa7JgVz/M8RG5/3qn5GibUavkMR88dJQVZuk/I7Y33+R9qOwk20NItOngS612jnt2hZw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1673309252; bh=nFCRAALOdJVOepdExywB8v7RnknYNQlGAfr1ya85Pc8=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=DSa7JwuwBkLV6l00NXnOyIr44e+lEFFZ8a4P3EMPcMpGbInWVh77BgrFCaoAKEQiIeumScpMUVSlL+m8o0vzX2l4XtU4ZCemJoddMwgFC6djS842HQZpleoBgK1cPj0fgjQUCIDNEHVPpHYxFHDkVpeBUEIXdoiPFu0bGnPRDRwCQ9Uhh9viyqyaz8d/b2LZExDKRyRTHf4LhYgLe88Zi6w8vF9r9V4uBAHouqDhzrGdArUobuFaBX/JScII3k22xm0k8TeEegABB0npmvB2Z0lBN7ttY+dj75tqxOo7Wt8xP/1Dj/+aUEjuqmEatQ7zuvBTrj/6UcxCojqd5ZvD2w==
X-YMail-OSG: 6VYIDtwVM1lfvejDjOPjsXuG7.vU5smWRTykHeFd1cl8ReMGrrANGFkQ1BAxjVH
 1bmhLyTI23B2OvNGBNdzClwcTSbq5g5BK8wpNw0ReoobjaK23Yi6EZ5AH6fXHMkRYUibFhbFMGGY
 S_Jv9bwoILhVVL1_UedMVme6K0YIKKNJ3KOnZvJrE8zugxX5twB9SNmuMBBIf8L32Jq6scwnA8Vc
 ET4UbAI5w5BEwEwQh4T91be9hIoopXyHVVC51ywi.Co0QZAgiCgzPACF.vtwJqq2tEP9GNGJLnnQ
 h7IRRoV1jLxSltR7ZY8KzjotWQ1SUydMzRhrQTMktfRGCCRswUckkDwMikB9OSPO9a3TwWlButHI
 J.nVbxJoN50G6uKn0uh_nQGGQ0RsONEfwe73zLB2Qy7_k3TdKaGGZ02GrCGGo5mj0eZqWe48qwjY
 aVtqElY0zrQGgbFIIDbt1BIkQ0p1oFcmUvJ2YvdGteM0CDSfV7qYxX2IH6e_1sIDDi1l0DBUkrP4
 nBZKV5Yfh3gWN4WbhTHJLJYc1l4LNrawQei8sFxkg3RqcHbUcXKjYfwSEGAWM86hzGyPBk9gwbfx
 qkI1hky9OSx1AHZNfRbq9Yhh_WkAhv1dQS4sRnC8xtYyTBtN3RljIsLXEN76.Zf.xJHvfR3Rkapj
 .o_YcXt7xA5ahkHKfwsAXdAzouBd.SRka1_URRhHbavUF_Kv5xILxDcbV.N2r9rTo7ZZelz8Yth1
 wi2Of8JsXEsyh5BRfK5bfh.puxWUtTxOVSqRg1dvQszXTBfHiggtPQM03yRnV44IIvwVZqXzdVQO
 kYXjM_T4RMFGeHMXmW2HavEMrmDgevuEPqZH5LViLh5ZAMY4.kys6GmaO3elB4ZkrWmK.1pnh4EC
 ekORxTg6OH9let0ZfG5NMX.1dZcTFLNMupDNwa89axi8DHTCzhrc_alYTVpr8wD.ObKFflQdNZcR
 a0WW5wjvrACPbphsOhgBWqFpO2MDTllyU7.Unnfo1EmZ0qbJCqkYUXjRa1Qn4oS8dFU9j9gKjQWB
 pVtPkJ55_46j41PiaGXI8hLD7MQczSzYawx3XKA9fBf8fv1Q9QypKqFaORsz1hJPRbMDgVee9hBC
 FVpM2WsEVYY.gEnWD_tCa2se1Bv2kw9s4u5pc3X3VOzfLHN8EI8fXd_4I6pvs1jqHy4UqduZ7W6Y
 EOwoTERAeBhMAi051Vm3FM9oIDWFDy9Dw6DYGY3qnmGYCdsRIQdzbT1XvbKOdFrUuc8btwPIwytn
 jlnDBpsqRRk89DbsytuzVgVovCn2T5xbuaFdKKq8ra1BWsAhT.8gp3T6wmsgDbhoWgpUOszyGsId
 w3m5YJ_zUzAYHrzRKtBZbVMRoOGwREe0.h_57gSWA9tlcoiRWl_.XFr2jG0i9FF59p0oGrBMXp.B
 HTRFVYQfgSP9nE4KGiK64bpifTypcvpIMN0nD2YhMp2QzP8DvjZT3HO1i4pYXTM4ghbg2q6S_tL.
 _mvqeyyzwtZkOpV8Gg6tjHLIF6ITZxVVGcCmKnGXBK.VnJuAWs4b1eQwKBTdbBqT4BQUgxuJvGxX
 1H8VQGsivLP.sq6Qk6DTMSSY4tO58QVRH_RMY1gm_iAdI8SIWeTwAkyU9DW.CN4AFKfL5NtffD0O
 j5RfFM_EE5DcnBjXqX.1nzLCQ_zGaSIHKYVRidoy8yifpdtNUzDv9.aS35ns_ktZ9dWizsur0Zem
 A.X28ii3y1r4egEJMQzur5yEp9WV0X704yiEb_8dp4aetjyWIKHmYdkQ0G0ZEAYSEjd9oJr5FOLP
 UJPd5NXTUNJ3RHG9V1jSRP38MOaFJOpAlSW_Po08.w8skQvkqCGgHEgVPL7GOPGl8RK.1KyBXFKT
 VznE9kIYac06bU77TZw2lVBMbvgLr7Nik8i2gTGjHTdCGA4nEiAbEq2fgyJ7pUkI60vOWrkUkKnM
 XtoCA2u_gmdX4Z3OTH0NFHAPjOStYiLwLNhbcVTOPcQn45FNffbSQMEs87YVIXCf3qDwr8fGTxzo
 ifJmNovycWkzV3RSTHRSM3MSsWDulkSVOqffSJ6Tz6a7_7m9g_V1f62FPh_nJ37oK6AOGlWaagYw
 ZsZtzTTGan7lhspITmnfZXjsqpsObHpbbFlukcDSgx9aML2ep4cYPU03GQtg71mfMpi_vI50IG9A
 OQLuCG_xlVgELCjCf22DM4Ys.XTXb2cxVOqkD8tqBGNVlYA_HKlB_wNgTmktAm2gjnZ.r2OQql9s
 qtlHn1sTQsw--
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Tue, 10 Jan 2023 00:07:32 +0000
Received: by hermes--production-ne1-7b69748c4d-pm9xv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 3690a7ed7136d7d2ab4095291adae14f; 
 Tue, 10 Jan 2023 00:07:27 +0000 (UTC)
Message-ID: <024b9ab9-4204-aebb-9f89-95cbabdfe868@aol.com>
Date: Mon, 9 Jan 2023 19:07:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v7] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org
References: <8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz.ref@aol.com>
 <8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz@aol.com>
 <20230109172738-mutt-send-email-mst@kernel.org>
 <8c2531a8-ce99-7593-99f8-222076fe6bd6@aol.com>
 <20230109183413-mutt-send-email-mst@kernel.org>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230109183413-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
Received-SPF: pass client-ip=98.137.68.84; envelope-from=brchuckz@aim.com;
 helo=sonic306-21.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.096,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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

On 1/9/23 6:35 PM, Michael S. Tsirkin wrote:
> On Mon, Jan 09, 2023 at 06:28:44PM -0500, Chuck Zmudzinski wrote:
>> On 1/9/23 5:33 PM, Michael S. Tsirkin wrote:
>> > On Mon, Jan 09, 2023 at 04:55:42PM -0500, Chuck Zmudzinski wrote:
>> >> Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
>> >> as noted in docs/igd-assign.txt in the Qemu source code.
>> >> 
>> >> Currently, when the xl toolstack is used to configure a Xen HVM guest with
>> >> Intel IGD passthrough to the guest with the Qemu upstream device model,
>> >> a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
>> >> a different slot. This problem often prevents the guest from booting.
>> >> 
>> >> The only available workaround is not good: Configure Xen HVM guests to use
>> >> the old and no longer maintained Qemu traditional device model available
>> >> from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
>> >> 
>> >> To implement this feature in the Qemu upstream device model for Xen HVM
>> >> guests, introduce the following new functions, types, and macros:
>> >> 
>> >> * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
>> >> * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
>> >> * typedef XenPTQdevRealize function pointer
>> >> * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
>> >> * xen_igd_reserve_slot and xen_igd_clear_slot functions
>> >> 
>> >> The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
>> >> member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
>> >> the xl toolstack with the gfx_passthru option enabled, which sets the
>> >> igd-passthru=on option to Qemu for the Xen HVM machine type.
>> > 
>> > I don't like how slot_reserved_mask is set initially then cleared on
>> > device realize.
>> > To me this looks like a fragile hack. I suggest one of the following
>> > 1. adding a new mask
>> > "slot-manual-mask" or some such blocking auto-allocation of a given
>> > slot without blocking its use if address is specified on command line.
>> > 2. adding a special property that overrides slot_reserved_mask
>> > for a given device.
>> > 
>> > both need changes in pci core but look like something generally
>> > useful.
>> 
>> I was hoping to not need to touch pci core but I understand it would be
>> better for this patch to not affect machines that are manually configured
>> on the command line.
>> 
>> However, keep in mind that this patch will only actually reserve the slot
>> initially for xen hvm machines (machine type "xenfv") that also are configured
>> with the qemu igd-passthru=on option which, AFAIK, only applies to machines
>> witn accel=xen. It will not affect kvm users at all. So I don't think this patch
>> will break many machines out there that manually specify the pci slots. The
>> only machines it could affect are machines configured for igd-passthru on xen.
>> This patch also does *not* reserve the slot initially for "xenfv" machines that
>> are not configured with igd passthrough which I am sure is the vast majority
>> of all the xen virtual machines out in the wild.
> 
> I'm just saying that adding a capability that is generally useful
> as opposed to xen specific means less technical debt.
> 

I agree with that.

