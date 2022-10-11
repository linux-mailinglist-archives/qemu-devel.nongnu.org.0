Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563DE5FBD22
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 23:42:23 +0200 (CEST)
Received: from localhost ([::1]:57758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiN14-0002pH-FQ
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 17:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oiMPN-0000gA-CJ
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:03:35 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:33657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oiMPL-0003xV-Jo
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 17:03:25 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N30VJ-1p9PS60Olh-013Q7V; Tue, 11 Oct 2022 23:03:19 +0200
Message-ID: <cca657c4-67a4-f579-3d3d-c0ddd886b87d@vivier.eu>
Date: Tue, 11 Oct 2022 23:03:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3] m68k: write bootinfo as rom section and re-randomize
 on reboot
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20221002103707.909560-1-Jason@zx2c4.com>
 <20221003110221.971024-1-Jason@zx2c4.com>
 <ebeb90c7-8f46-4af0-073d-6f1710d3eeb2@vivier.eu>
 <CAFEAcA-0Uz_nT6V5_7Mkqrg17sX-syrxfyBjZQFUjU5UnPdPcg@mail.gmail.com>
 <Y0WC1i1fWi9Q8WsJ@zx2c4.com>
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y0WC1i1fWi9Q8WsJ@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ep8G5Gh5K7VuCBYzwfk4eiSQOGL4Dbm/+RxDHsKe1O6Wvtw4r1+
 rdFhtKWiglTzWhpI3vukobiu0XPbX91CRu6v1iTqULp9JPphiNnlfozUbG9N4Q9/gcwMODN
 b0IsKTZmIzvIpdrxQOYA58UZcMIo2p6SKISFBpmF/HmtyqY9JZxno17q2W27s3gxJUUd9fg
 wWvSK5VZIWDnHjdkfnd5Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t7wpfYt3INI=:C8FiLqTLO/jk/DUJY6qF+v
 mo53f7F67zgr00lFPNgGPMEH+up0h+qPm7CcndvDvtXthCWxUpTLmcGCqhoHm3DGm4znou4W1
 9UCuID8bA3m0KBgXKBj1x0816FtQEJrLgthD11rXOA13pPnWdAAwwnclSkjfdLk8s0z8TfPmu
 aPyKhvPg3bH7XafmjEqnaU2b6vU0wAhQDDnzv3PEN0cIH9Nb0Km86BTbPto9I2f/golkv0AvR
 cfJRYYybhCpIxXD+9tdVGJGeP7m0ZMxNEa7eMnYFmL3k7er8Wh+xuFy3aB1fsG3RLelEKzuJS
 ijC6xNJyKrV/dudB9bHu/qj6QtjByma+uqRQPp8WwoRd6IhwDcOrPGnBhmxd5Sk5EBrwASBKp
 hQL5PBm3rOPGgrIKSZMFWQlRsXKKcrDqeCx0NhCSwCP/I3diBHmXgeYHJwGsemtS+65KxVXRz
 WiIkvXBdP5nHCSzb4ySmMAm1kclhxS4Xak88hGIM3X1AOMIlA9UUefF6ImAz03usrl/yWYe7E
 FUYZz1pYe5QISOUXJUjwBFJZ8HGuDFjxK8XThR7mSHQSn3fyPQ2XBTyoIuxWIpBumz0rUv17N
 wNs0VgrstbKbHF6wFDgZk6sMmpGkJogrkjOcvcmhirVXcE649ZdJWduHEOjvj/MUtw2B70Ccn
 PypXbE+ThokCARuVjFrK0SvV84GmY5FX+yDAAUTa2QE1BN8C7iIcvthcX1WbNw7d22Zf5Nejy
 mUYLG9CQ/2Eb4DjyNpIW2co2NWtux1jo77XOtQFIn2cQQqeaELHChv+IJPxQuSSX/Oeq7Gna+
 p0Jhe2C
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.934,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 11/10/2022 à 16:56, Jason A. Donenfeld a écrit :
> On Tue, Oct 11, 2022 at 10:29:45AM +0100, Peter Maydell wrote:
>> On Tue, 11 Oct 2022 at 09:41, Laurent Vivier <laurent@vivier.eu> wrote:
>>>
>>> Le 03/10/2022 à 13:02, Jason A. Donenfeld a écrit :
>>>> Rather than poking directly into RAM, add the bootinfo block as a proper
>>>> ROM, so that it's restored when rebooting the system. This way, if the
>>>> guest corrupts any of the bootinfo items, but then tries to reboot,
>>>> it'll still be restored back to normal as expected.
>>>>
>>>> Then, since the RNG seed needs to be fresh on each boot, regenerate the
>>>> RNG seed in the ROM when reseting the CPU.
>>>
>>> As it's needed to be refreshed, I think it would better not to use a ROM and to regenerate all the
>>> bootinfo data on the reset.
>>
>> I quite liked the use of a rom blob in this patch -- it gets rid
>> of a lot of direct stl_phys() calls (which is a semi-deprecated
>> API because it ignores the possibility of failure).
> 
> A ROM is also how other archs do it. I'm good either way though.
> Laurent/Peter - can you guys decide something and let me know if I need
> a v+1 that avoids the ROM, or if you'll go with this v3 that uses the
> ROM? Just make a decision, and I'll follow it.
> 

If Peter likes it, it's ok.

Applied to my m68k-for-7.2 branch

Thanks,
Laurent

