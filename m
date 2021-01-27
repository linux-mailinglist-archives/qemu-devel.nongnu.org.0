Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C706306095
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 17:09:00 +0100 (CET)
Received: from localhost ([::1]:59290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4nNL-0001rr-Uk
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 11:08:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l4nMR-0001KE-UD; Wed, 27 Jan 2021 11:08:03 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:55293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1l4nMP-0005Lv-Q3; Wed, 27 Jan 2021 11:08:03 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MMnru-1lNYf13vlM-00IjSG; Wed, 27 Jan 2021 17:07:40 +0100
Subject: Re: [PATCH] MAINTAINERS: Update 9pfs tree URL
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <161071814430.152031.14540382419012818908.stgit@bahia.lan>
 <2867808.c4G3KLOmWt@silver> <1679340.e36fRnoiaZ@silver>
 <20210127170255.1d381a0a@bahia.lan>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <bb2628ed-0e46-16e0-030f-5b846f3e0c62@vivier.eu>
Date: Wed, 27 Jan 2021 17:07:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210127170255.1d381a0a@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0yEBrTmcaro2gGaxJMbsxK4YymEFXSiq3jtidQe0q+5FM77cSWy
 v4IvwczAMq0h6jPuS65R6voVcxhsBOS2Ee0hhKSZEA6DgFtdG0AsmYjmQUCbZqeisuxBugi
 iSLARiAvsvVOT6Q0dvwHpu9WeFMmltu2AJDGpGzATnMRb8vPeofTxCfsrSeqEQycLVKDJrT
 toqUekPVaSnUcnJhXkh4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4aOnpsaRhOo=:CVA44XZk295Cc+lvqYLcOs
 BOatDQQUfhT+9z7PGvCJswwQPI/zRy3r7JDIw044UHcwcQkWUO+EM3MOFdJ3WTRy3JLCbWPK7
 y/YvDzBa3tsGc1WwlxGkC7nUbWYr5ND7ZBtnxX8r4yiRClizzS4PPMSH/BI9JV9+FF+ZjYpLo
 lwtmmXjK/RDiX7AAmnd5TGXRVu6B0lyMpkjS1V5SrSo7QKxt2mOiBNCynOvPpV5h3uhuCrL5L
 ietAaKtdMSKYK6ytd9vdLw4ezEj+ObS64lIQ1uGyoqLTxJCuporn+EziWvpUqKB3Zx6h0G18m
 6RFz041ZewhNOJbX3HmNKEzFSz35hLwKXFJlVk12UqydYw6zdBuHGNRUBJhS1mfayn1aqQCef
 lLo9GaIV7kYQp/l6KKninNR/IdS5LhTKgKe5z/8uhAtUGAwuOHt6ghJaG3G6LcxCWjML5f5e1
 //JYZ1h41A==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/01/2021 à 17:02, Greg Kurz a écrit :
> On Wed, 27 Jan 2021 15:33:51 +0100
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> 
>> On Freitag, 15. Januar 2021 14:50:17 CET Christian Schoenebeck wrote:
>>> On Freitag, 15. Januar 2021 14:42:24 CET Greg Kurz wrote:
>>>> I've already moved my repositories to gitlab for extra CI coverage,
>>>> and I won't use the ones at github anymore.
>>>>
>>>> Signed-off-by: Greg Kurz <groug@kaod.org>
>>>
>>> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>>>
>>>> ---
>>>>
>>>>  MAINTAINERS |    2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index cb0656aec3d4..21038d3fdfce 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -1828,7 +1828,7 @@ X: hw/9pfs/xen-9p*
>>>>
>>>>  F: fsdev/
>>>>  F: docs/interop/virtfs-proxy-helper.rst
>>>>  F: tests/qtest/virtio-9p-test.c
>>>>
>>>> -T: git https://github.com/gkurz/qemu.git 9p-next
>>>> +T: git https://gitlab.com/gkurz/qemu.git 9p-next
>>>>
>>>>  virtio-blk
>>>>  M: Stefan Hajnoczi <stefanha@redhat.com>
>>
>> What's the status of this patch? I would add my T: line below just for the 
>> records. But I'd rather wait for this patch being merged to main line.
>>
> 
> Drat... I forgot about this one and I'm not about to post a PR
> anytime soon.
> 
> Laurent,
> 
> Any chance you can take this in the trivial tree ?
> 

Applied to my trivial-patches branch.

Thanks,
Laurent



