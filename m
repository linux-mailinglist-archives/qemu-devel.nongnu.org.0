Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FE567F7F9
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 14:22:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLl8t-0001gO-Pl; Sat, 28 Jan 2023 08:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pLl8q-0001gB-GX
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 08:21:12 -0500
Received: from sonic312-23.consmr.mail.gq1.yahoo.com ([98.137.69.204])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pLl8l-0000Pj-5L
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 08:21:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1674912061; bh=v3KX3vA5DfTtOLzzanNJVX6ioMD/X5Ike2f4Ruvxijk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=MFB+IJ/Z5jxutZ3iLPpd2tNEbo2R/aJmMIrl6R+NgpU+TOABe294R7pFKncq4iSwmkbuVLXOCP7yZMAC7VExQD2RhlmC684xY2CfeMGxYToU9D78grfvCc8vF4Yhwk8AZR5vEE8/cybQdxuNbUiq99Sk0MFT0vowG2UReQ+JSfyAlFZZw6NpNxIaUhJ1meiahXl9mCZXy6Haid0c2fMIjrcsi+fN8oO5kBwmDYcGdUert6awrr6l07v5rtoVYV02ihgQOqnBUpSMkOyQWMBaN3zNUl4j/qfrithRVNsltDs6DZQ//w1MAOO+fGu6KlAdvMNRpKBkZYmwwQWFdGam8A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1674912061; bh=fBFv2fyDdvm7nynRRQbAP6rM8bF7M1NHsjIo4YiZmja=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=shOV+FHUh1LlFGzpmNyAqnUj+oXZQvnO2rGGGbqmvYzPOR+HJITDygllJEZa5CJIh+V5QUx8VgaoEKEunUX8/mYg/YBsTEp2yjrenmBKIoUhmn9fFVg7Neb5iMSSu57Tzet7qGje8YoamWmW8TdtmhBNYz0gH5NWd23psYc7LwdjT5NlY27j4LvAK419EM/GYUeDCoLH5urrhjk1RSqrVvtivvKZbTbNlDe5gf4Q90jTMbj1lcJgcd3/a6HeWVvgs9lFmZ9++htq2j6jRFrH+Js7OfIm1zoVlqPp8s3tOxnAyDFjUMurjtw5bF8mSAw6VNcfgDCVNA0cx4it+asbdg==
X-YMail-OSG: sdT3TtUVM1nb0S5qHMlsGW6SvY5klmGMUWf8cGCuAGQXjzo.uoOjlNIrwj8ppvx
 K6bd_rQifQySNPfyhLSTTGwoZVD.i5SkhMOgtSEQ2YJVjGBVAY29oaZ2DmQJ96k7PwhaZNnW1dpd
 si37MGLXwSvtBh2MxqdwEzMic9l7zRcm4y5RhP3diFFHD6oawYmgGqQ0CZkP39yk6pj53J02viOM
 4gORUhr_bR_dJHHx7h4kWBDVKT6TD5yTQ52jr7QxU8rdIUuA9R_7DvW.z2EzNN9SeYRTJTXm4WAk
 5hq4WUJla3t5A_NH3T6KbHM_gxr28.liLZNR0K3PPh5_1PfTqdLJ8NLpg7pJ_TlBhuscTIAkT0oy
 ldZJWTaMC29A3Xu5yUsVo0650A.kSXxoOBlvbXXUTdFVGfA3feRuql4fSaeQvlFH2UYHpRPVsTzi
 EFTJVrZ.MfK3l7u8jwIuJpTBD93vKrmpmJE23I4dfnivrS0jguaeFi0yUFt1.Gl6FvhJ0LB2Lb3I
 SDguIKec3HiY7YQGV1rxoKKZ04neFUUBfck9N92w3Q.vSdn6HFy7KGecIbqPvMcfIieANvyS0B6I
 sVi6m1KPHtO0x2Bdcrjd3hRaVjENy1AsSxi6CriZXt.2hapW3Scmm0KG453Slpe4kM.q3M5mMrmd
 RhpVrfA0Z3JlMTM3TWnm_Z3BUilRpWIQ35MWfhjJf5OlpfuRc0m_cB5l0fcIwOL6eRmf4YZt_X3U
 QVbkOqq_o9Pm2OmQ9f1a.S0A9ngdL5mG.mnJlGHcTxe1qv_8bfY7EuhKdw_VScxDUoNmzeP9CCyg
 AxPyV7phJGtZRjoCEluEaL2Et0xVZWtpfap4eG8eI.qV4gyQv7Yj9guYqi06VUe4APT.MfZYF9Xx
 GLB7MzUEL2bvNXHIjAwBncqojRTq5HTORoqdcUV7bqNT_SYmInhi.APWklNrYinLiEeU0P5s0FLB
 P7MhkZFVeN4WzEGW9DJZ6j5MHh40qYmglKfOKPgQ41xXLLD4KrWgXGu0oKbmsBwPYQSz42LsVQEX
 xxFBZEps5L8wBC7ZzvPIOZe4xtSDLVgLtY9IZYIS8x4dNryfti3MutLBzafMKiyXsERh2NqIxbLo
 1usWPxZ1B6xn9AcH8XQjNY4Br6mGfuBC1FOfKYiY0erhMN.g1NnSsDK4249ESLcCZYNAPlpdARSa
 wzntsPsR1pDK6_0qKPAqZ68DJSDLaiOQKYCIqaLWWPecAnWR5C3LIKdPoaMYZlM6utAvTOMf1pYU
 7kGmbFhy8ofbqUzWhXcTTnnA4cuhtBKlfJwF1vsR13UYBVKEPCAHsMrNFoJewYzg5mDFTxfgmqPW
 QyJmD1xaDbrW2bc_YY.25DBjmID3jeSjeV_IAcZRirjnfzEMcgQTifl2nSFNmApNlVuqWXkg3tb0
 DjZL4IkCpe21RtEO3pJmqyZnJjs0Dpr6jVOHVOlX5pV8nBOSOC5kKqJN3gYiRpdoUDq_7PJibnGy
 zCGyXIB98Q6QdxfbFonnhzTAdDZU4b8ABjsltcsJUc7qt.oH6LeSWlBxkPjDNqulh6VwhNfvFxbT
 ftnIfA197CG0uvYlHd2p4IqPNxNxoQuU.SWct9H7hPjCVcKsA_HIClZH9CgbOmsuwNDxE9jJRvuW
 fqQ2Zv94MTO874EW_fOUslpks4wYfuCly9OJ.WwwCBJ1f3sZkhBTaqTrtdYepam8u3LGC21dHfue
 m0VEBqHs0ZSDEN89HIhCXt_GFba6zWQm4PrzlPZZ.ic6WBDhhZ9xbNLIITQyDYcRJrVUFkwybSny
 .vCafFAAQ1ehGnDFpNkaSSQLay4jxwLMBRwTEkzBfvGzFMjmcP2pLYISEE9kXAwWz0SW4jGXun4g
 pDq7h._ChIx3L2SLJXTKGj8n7Hu.U92uBw1wnbsKUgc9a_4TNpIsTv4b1sxXqqWoSrJB5uOTFwOX
 u9wu6ZbTDTSL4u8Y5z3wnnRLbctW4uvgBNTTvSy9e34MK2qbb_egw.xfHjLP73.B6ClfnGeQxX8.
 JIk82vSrhHXrLv.0qXqsQSyIYDzZAyZn4BwHu3RWD5KMQ8pMAvmbVJZlbuMGnccoJartxKXaHoF3
 hZUVbhvit5AA_e1CyAMd5GSLjyQU_vwL_LZijgUL.bzhEaFg6oBo7VQVbQjPui1KYgioQcu9HgOQ
 QiZheGLoDo9blSeyuTznPOF7jkUfFmK7HCBeg21pgf.NiBWqgnL752_mvn0jKPNuVWO9IA8aX8B.
 t5exwOzn3
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Sat, 28 Jan 2023 13:21:01 +0000
Received: by hermes--production-bf1-57c96c66f6-p9vmd (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID cb26f56b7e350b359bbd0f4358fb1511; 
 Sat, 28 Jan 2023 13:20:57 +0000 (UTC)
Message-ID: <56643500-7bdd-8204-0529-fa004ab10a44@aol.com>
Date: Sat, 28 Jan 2023 08:20:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
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
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230128052506-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21123
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
Received-SPF: pass client-ip=98.137.69.204; envelope-from=brchuckz@aim.com;
 helo=sonic312-23.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.15,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 1/28/23 5:26 AM, Michael S. Tsirkin wrote:
> On Fri, Jan 27, 2023 at 10:39:28PM -0500, Chuck Zmudzinski wrote:
>> On 1/27/2023 8:28 AM, Michael S. Tsirkin wrote:
>> > On Sun, Jan 15, 2023 at 07:49:51PM -0500, Chuck Zmudzinski wrote:
>> > > The current reserved slot check in do_pci_register_device(), added with
>> > > commit 8b8849844fd6
>> >
>> > add ("subject here") please
>> >
>> > > ,is done even if the pci device being added is
>> > > configured manually for a particular slot. The new property, when set
>> > > to false, disables the check when the device is configured to request a
>> > > particular slot. This allows an administrator or management tool to
>> > > override slot_reserved_mask for a pci device by requesting a particular
>> > > slot for the device. The new property is initialized to true which
>> > > preserves the existing behavior of slot_reserved_mask by default.
>> > > 
>> > > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>> >
>> > Thanks!
>> > I'm trying to think of the best default for this.
>> 
>> I think it would be better for the default value of
>> enforce_slot_reserved_mask_manual to be false, so that a
>> user-specified slot will by default override slot_reserved_mask.
>> But doing that would change the current behavior of
>> slot_reserved_mask.
>> 
>> Currently, this is the only place where slot_reserved_mask is used in all
>> of the Qemu source (code from hw/sparc64/sun4u.c):
>> 
>> ------ snip -------
>>     /* Only in-built Simba APBs can exist on the root bus, slot 0 on busA is
>>        reserved (leaving no slots free after on-board devices) however slots
>>        0-3 are free on busB */
>>     pci_bus->slot_reserved_mask = 0xfffffffc;
>>     pci_busA->slot_reserved_mask = 0xfffffff1;
>>     pci_busB->slot_reserved_mask = 0xfffffff0;
>> ------ snip -------
>> 
>> I think we could safely change the default value of
>> enforce_slot_reserved_mask_manual to false but set
>> it to true for the sparc64 sun4u board here to preserve
>> the current behavior of the only existing board in Qemu
>> that uses slot_reserved_mask.
>> 
>> What do you think?
> 
> I guess first can you answer whether this is still needed
> with the latest Xen patches?
> 

It's not really needed except for experimental purposes to allow
an administrator to test experimental configurations with a device
other than the igd at slot 2. That might be useful in some cases,
but it is not really necessary unless someone asks for that capability.
If libvirt users who ordinarily like to manually specify all the
settings will be OK with the proposed patch to xen that prevents
an administrator from being able to override a new setting that
reserves slot 2 for the igd for type "xenfv" machines configured for
igd passthrough, then there is no need for this patch. I don't think
many users need the capability to insert a different device in slot 2 for
the "xenfv" machine type configured with igd-passthru=on, so I would be
OK if this patch is not included in qemu.

Chuck

