Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0E24DDA16
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:02:46 +0100 (CET)
Received: from localhost ([::1]:38754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCFg-0005xI-LV
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:02:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nVCBe-0003Zt-Do; Fri, 18 Mar 2022 08:58:34 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:50155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nVCBb-0006Xc-IY; Fri, 18 Mar 2022 08:58:34 -0400
Received: from [192.168.100.1] ([82.142.28.230]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MbAYo-1o6SoS4BIW-00bXyS; Fri, 18 Mar 2022 13:58:25 +0100
Message-ID: <af35bbd9-6683-b68f-eb97-fb7c7ab68c2e@vivier.eu>
Date: Fri, 18 Mar 2022 13:58:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH vRESEND] virtio/virtio-balloon: Prefer Object* over void*
 parameter
Content-Language: fr
To: "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
References: <20220301222301.103821-1-shentey@gmail.com>
 <20220301222301.103821-2-shentey@gmail.com>
 <20220304051952-mutt-send-email-mst@kernel.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220304051952-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:x34MfYIanpXryuHF3qHkpvdRrGMjnpj77kTsR+S54qpizGrAKG/
 5oZEZcUknM+etmvsI7s5IZTQgxsE+E/FEX5raiIUNDTFPm0d96L4f/qlzDcafZBhXeFaBS4
 tQxVktZHdSNROtuj6anfAjI0g5dnN9m7mlk+BuopKkyD5qplWiKXSAU3tXMx/kL6IhaFRAM
 IA87wIn6J7A18gzpi/MIQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:py5J7NMGDI8=:W23+2JfwLJ36KcfJJZqYfn
 RPSIqkB8lMzc5oV3UzgZWtmm6divVH9PG03wSKofQLII5/4BGO8q1CC6etRicdsn8X8erFHrb
 WclYLcVWlO9IchVOYZwukEJ3b0Rx/zOXgxsN/kcuec6bnJAfgdrVRx6RJNu/TJs9PieRp5xBn
 otnj7QcAVdrgWnLlvTBOIeKiel8uZL2QqyJchZx6lmE95iapj008ub9VKhAEdjQa2gL1TUXnv
 6NsNwNDwFylWZL2rmO4Jl854h9j6ZTywI+0JJ1aHIWZYhcxK9Jf48SFfYn+PC88vVt+lzgYFN
 xyd4WrV7YHBIRuNXDHQEvtx3EyHv6BxZVt+LSZbSC+g4/aa4fs1/4qqyL3vKSrBL3fOXtaqoE
 VsCpGg2SiOvLN5HuTicKnr0qRa8oB2xz5/LR5huDZ7Ho22bg07lpB4a1id8qNTG/QBq38AUoL
 Y2XsRgsRJ7ZWyB8MY6axj42+lG3swvlxJiY0XDET5TYhpydVk7km4FAQi/R5PXGx5tJnxe74t
 CurgbxcBjl8o31V8HwIIXl4aP8fqJCcmEPNxHk3SdfVNF0/vWwqQ36osG4wnIK43Jkikg/DDO
 YjZwg5NvZgAhNLBhYh7b5K5LmxXY1YTFdC4VRHNO6n+a2eI6gJ2IB+ewADg5HpuUR6o/8Wp1z
 8WrvA0XMc/WzpWpdf4C0pH2cKsOKgHZQ2xk73WyFgfO1k0i88kZEvwE4bcWGfL4pQQAg=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/03/2022 à 11:20, Michael S. Tsirkin a écrit :
> On Tue, Mar 01, 2022 at 11:23:01PM +0100, Bernhard Beschow wrote:
>> *opaque is an alias to *obj. Using the ladder makes the code consistent with
>> with other devices, e.g. accel/kvm/kvm-all and accel/tcg/tcg-all. It also
>> makes the cast more typesafe.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> Reviewed-by: David Hildenbrand <david@redhat.com>
> 
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> trivial tree pls

Applied to my trivial-patches branch.

Thanks,
Laurent

