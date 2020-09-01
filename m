Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D2B2588E2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 09:20:08 +0200 (CEST)
Received: from localhost ([::1]:56532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD0aN-0003gn-Ms
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 03:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD0ZZ-000398-S1; Tue, 01 Sep 2020 03:19:17 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:58519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kD0ZY-0007qk-5K; Tue, 01 Sep 2020 03:19:17 -0400
Received: from [192.168.100.1] ([82.252.135.186]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M89TB-1kHfPF1OFP-005MKP; Tue, 01 Sep 2020 09:19:06 +0200
Subject: Re: [PATCH] qemu-options.hx: Fix typo for netdev documentation
To: Peter Maydell <peter.maydell@linaro.org>,
 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
References: <20200727045925.29375-1-tianjia.zhang@linux.alibaba.com>
 <20200727054335-mutt-send-email-mst@kernel.org>
 <cb08fa85-e7d3-09af-d702-036fd165a46d@linux.alibaba.com>
 <CAFEAcA8iK-J3NKA=QxFV5uswBSXLNNQDbx1NnFzhz3ppWVEVkQ@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 mQINBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
 WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
 SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
 UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
 Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
 JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
 q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
 RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
 8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
 LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABtCJMYXVyZW50IFZp
 dmllciA8bGF1cmVudEB2aXZpZXIuZXU+iQI4BBMBAgAiBQJWBTDeAhsDBgsJCAcDAgYVCAIJ
 CgsEFgIDAQIeAQIXgAAKCRDzDDi9Py++PCEdD/oD8LD5UWxhQrMQCsUgLlXCSM7sxGLkwmmF
 ozqSSljEGRhffxZvO35wMFcdX9Z0QOabVoFTKrT04YmvbjsErh/dP5zeM/4EhUByeOS7s6Yl
 HubMXVQTkak9Wa9Eq6irYC6L41QNzz/oTwNEqL1weV1+XC3TNnht9B76lIaELyrJvRfgsp9M
 rE+PzGPo5h7QHWdL/Cmu8yOtPLa8Y6l/ywEJ040IoiAUfzRoaJs2csMXf0eU6gVBhCJ4bs91
 jtWTXhkzdl4tdV+NOwj3j0ukPy+RjqeL2Ej+bomnPTOW8nAZ32dapmu7Fj7VApuQO/BSIHyO
 NkowMMjB46yohEepJaJZkcgseaus0x960c4ua/SUm/Nm6vioRsxyUmWd2nG0m089pp8LPopq
 WfAk1l4GciiMepp1Cxn7cnn1kmG6fhzedXZ/8FzsKjvx/aVeZwoEmucA42uGJ3Vk9TiVdZes
 lqMITkHqDIpHjC79xzlWkXOsDbA2UY/P18AtgJEZQPXbcrRBtdSifCuXdDfHvI+3exIdTpvj
 BfbgZAar8x+lcsQBugvktlQWPfAXZu4Shobi3/mDYMEDOE92dnNRD2ChNXg2IuvAL4OW40wh
 gXlkHC1ZgToNGoYVvGcZFug1NI+vCeCFchX+L3bXyLMg3rAfWMFPAZLzn42plIDMsBs+x2yP
 +bkCDQRWBSYZARAAvFJBFuX9A6eayxUPFaEczlMbGXugs0mazbOYGlyaWsiyfyc3PStHLFPj
 rSTaeJpPCjBJErwpZUN4BbpkBpaJiMuVO6egrC8Xy8/cnJakHPR2JPEvmj7Gm/L9DphTcE15
 92rxXLesWzGBbuYxKsj8LEnrrvLyi3kNW6B5LY3Id+ZmU8YTQ2zLuGV5tLiWKKxc6s3eMXNq
 wrJTCzdVd6ThXrmUfAHbcFXOycUyf9vD+s+WKpcZzCXwKgm7x1LKsJx3UhuzT8ier1L363RW
 ZaJBZ9CTPiu8R5NCSn9V+BnrP3wlFbtLqXp6imGhazT9nJF86b5BVKpF8Vl3F0/Y+UZ4gUwL
 d9cmDKBcmQU/JaRUSWvvolNu1IewZZu3rFSVgcpdaj7F/1aC0t5vLdx9KQRyEAKvEOtCmP4m
 38kU/6r33t3JuTJnkigda4+Sfu5kYGsogeYG6dNyjX5wpK5GJIJikEhdkwcLM+BUOOTi+I9u
 tX03BGSZo7FW/J7S9y0l5a8nooDs2gBRGmUgYKqQJHCDQyYut+hmcr+BGpUn9/pp2FTWijrP
 inb/Pc96YDQLQA1q2AeAFv3Rx3XoBTGl0RCY4KZ02c0kX/dm3eKfMX40XMegzlXCrqtzUk+N
 8LeipEsnOoAQcEONAWWo1HcgUIgCjhJhBEF0AcELOQzitbJGG5UAEQEAAYkCHwQYAQIACQUC
 VgUmGQIbDAAKCRDzDDi9Py++PCD3D/9VCtydWDdOyMTJvEMRQGbx0GacqpydMEWbE3kUW0ha
 US5jz5gyJZHKR3wuf1En/3z+CEAEfP1M3xNGjZvpaKZXrgWaVWfXtGLoWAVTfE231NMQKGoB
 w2Dzx5ivIqxikXB6AanBSVpRpoaHWb06tPNxDL6SVV9lZpUn03DSR6gZEZvyPheNWkvz7bE6
 FcqszV/PNvwm0C5Ju7NlJA8PBAQjkIorGnvN/vonbVh5GsRbhYPOc/JVwNNr63P76rZL8Gk/
 hb3xtcIEi5CCzab45+URG/lzc6OV2nTj9Lg0SNcRhFZ2ILE3txrmI+aXmAu26+EkxLLfqCVT
 ohb2SffQha5KgGlOSBXustQSGH0yzzZVZb+HZPEvx6d/HjQ+t9sO1bCpEgPdZjyMuuMp9N1H
 ctbwGdQM2Qb5zgXO+8ZSzwC+6rHHIdtcB8PH2j+Nd88dVGYlWFKZ36ELeZxD7iJflsE8E8yg
 OpKgu3nD0ahBDqANU/ZmNNarBJEwvM2vfusmNnWm3QMIwxNuJghRyuFfx694Im1js0ZY3LEU
 JGSHFG4ZynA+ZFUPA6Xf0wHeJOxGKCGIyeKORsteIqgnkINW9fnKJw2pgk8qHkwVc3Vu+wGS
 ZiJK0xFusPQehjWTHn9WjMG1zvQ5TQQHxau/2FkP45+nRPco6vVFQe8JmgtRF8WFJA==
Message-ID: <854a7e98-5265-d856-892c-beb9a92c4810@vivier.eu>
Date: Tue, 1 Sep 2020 09:19:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8iK-J3NKA=QxFV5uswBSXLNNQDbx1NnFzhz3ppWVEVkQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EB1bZ2m2kFazt5ke4xZm9cv1gWPU4ybl5pteedZEw85JMjkvv3t
 uXmqPMPlyj5VLLjyb6BrePZQwQ5Jk266hRxcQKgIZAxsvQsOv4148N4RltPgku0jekuIMyY
 boBhJCvFvutljXjXlqcDKNBtVe89ZsVzQbv0dVz2PQy+2THUYqnmT5DKNGC4p2QnxTDxkvV
 hoAkCk5J/ZDwEOlARH/6Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sAaptwHF5qA=:BsN5aCFOyn5GTeU6bZJbC8
 pq3XClwj/hnFayaiDK04qrUtNQI3wXxPCjEc4OiQfMrmefs/qCDi3DYtHuWmYanGCiHB1SSp1
 Nn2/dmdeK4KGe9byeyyNbOIAkiKWyihqo08q/1fEsrfnZ07coDSbIsvRykFzLZHciYpmh4+Uu
 YchKGGmeXVbc22kYz3tCEbLC1YLZXXSfJ29jcOZ9Rv6BWJLc6Gx6bxXqs0a9q0J9xGPNNpCzn
 Jk11+e0xgfBRGKI/2j2GS5H6XlNsh0DC9J2UQHNzrQiqHH/tGqya1/txQUspv3Dfe6TIpoxNP
 wkXyu3F673EI+eJBkf8ZT3rKhUZ7xBhhtURbtbiJrHyNQr/uoo5Fz4yJjvtogbV+G+kN9m/SY
 qz1JyZWNOLQIZnEO2tf78S3mf93/nxVGUHS0PXxWTbrTfAx7AYrboI0EyjTnUSPRpUn9zFCFc
 jv5rZINjjcLqwF+EwQbxHU/2miPp0Zf3sMaK+qZZsdsIXLSKy9QwIGp379RU5ET7Qu/ooRALs
 HhZzm/IoyqMq2so3MBNoqmPngkjpsQnd+CiYa5NkMWG7FTNiPIZEQcLSqQY3c/7AMswfDtpu9
 fcBRJBHV1ncxvPJeaW02HsdzSlyqiWMKxxWrr4kbAkA4bacg/NwJSgWM+KwEryqiBGgXltxVI
 ADTKl8Ezr3OKc3qTGd8RoELoMMG4aOU8SzxPtwNkb34ULnBj64jS/hZKQFJzITWNK3L/NRnA3
 cWeqTp3rf0ntXRxQ2sBjQByqqw3Hn9+QZE5GVDELQvFLqWEww+goOzOQ7xG3pthHHUDWfXVUg
 EZEbyjOeg0/hMhvEwR6qAOsukExWA4nOKcztVMkNqv8doU3ufEMXkhaagHCVg2epurHz7GD
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 03:19:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.13,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/08/2020 à 15:03, Peter Maydell a écrit :
> On Thu, 27 Aug 2020 at 14:00, Tianjia Zhang
> <tianjia.zhang@linux.alibaba.com> wrote:
>> Other opinions needed?
> 
> No, the patch just got lost by accident; sorry.
> 
> Jason, could you take this via your net tree, please?
> 
> thanks
> -- PMM
> 
>>
>> On 7/27/20 5:44 PM, Michael S. Tsirkin wrote:
>>> On Mon, Jul 27, 2020 at 12:59:25PM +0800, Tianjia Zhang wrote:
>>>> This patch fixes the netdev document description typo in qemu-option.hx.
>>>>
>>>> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>>
>>> Trivial tree? Jason's ?

I'm taking it via the trivial tree.

Thanks,
Laurent

