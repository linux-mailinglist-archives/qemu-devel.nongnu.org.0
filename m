Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CAC28BBD1
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 17:27:21 +0200 (CEST)
Received: from localhost ([::1]:48926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRzjM-0002g1-2f
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 11:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kRzgO-0007tZ-JY; Mon, 12 Oct 2020 11:24:16 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:34789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kRzgM-0005vz-K6; Mon, 12 Oct 2020 11:24:16 -0400
Received: from [192.168.100.1] ([82.252.141.186]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N2VGj-1kL9yo0OVD-013xQ3; Mon, 12 Oct 2020 17:24:09 +0200
Subject: Re: [PATCH] qom: Fix "typddef" typo
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201007220255.1170167-1-ehabkost@redhat.com>
 <20201012144512.GI39408@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b6d4e780-116c-af48-863c-1a65a8bc8c2d@vivier.eu>
Date: Mon, 12 Oct 2020 17:24:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201012144512.GI39408@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JaFjnB4NgPFu3rXYFnheWZ3QWjIT7dYbREaVDpRILvsgD5F1ejV
 6Ad2SlWlUAFTDGAQ175ZdzuJBmUYAti73R7SRqye7KVmzF35zXeX07tr3iZzgOB0H7uMyeD
 BP69/MUli4IrISw0dtBgSfhxYiBFO9gNXl1llzpCR80T1sJODB7KjgVT2yy1DjVi78OaJe3
 1Hs148bTBnRP1xpXKT1aw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:N1DexPzQnKM=:IOWINbxiZu6LaxmQEPYysh
 ueSOo6+9hsNDvFT5r7ObKht1ciWUQsx4GHK0Xf9zwH9SpDFbSoYfo7bDFVjRw65AEsOpL0EP+
 ie+x23lXAF9IhITreq4QXjLFvY4QsmlyjO6M/DcRXvoNs5JLjzdze4PAT3k22yjhiPZgXfvrt
 x5rCQSF1AsWZ9BXW3Csf0o62MjiutZernkBKTSj6cb08tUZBegrl4AHNmPRcIENdBfFjIAqdY
 hiVBGv9miDDWQUbyEV+I9r9WeklC6fFiy3EpzySCv5+2Xw8dms31UVVyWNfje26p6rQJfH1bZ
 z/1L2PJUQIh+GchO4yjm/DGuL6j3M+dyfQ+wOq0191UTDJiS/LbtcZ3AcmrTAUgfEJEkl1OWM
 drzuN7P2/6qBHrSfFocQoCuAYZncLNgrx9sy9HCqy8xdVN/wjhFfrWOrXoEF5eAdSVhVLkoLg
 UJFLnEJWJi1jqjin8abs+xmwqdCNrHgpMcacBVuudUKzR9tIHu3yhoiz0gf7ztgDh2VwcdyUT
 mIyomax+s2nv3FDucE9SspyV9jtq6IKZysougNEnSVPIj6pWFe+Xn2FZ3yVpZwbZt39jMvYB4
 F3MYdc2Go1vDL7XgtrYP3Y7Zqftr9aba/HCuOjXZB/PGXN10C7v9X0JX2uqIuw6hC1jtFbjXO
 hKAdL8SdL/D+7V48ThcCoFbg9tpb9Vtb4PjuA8dBLKjcFAkwGvh515RZWI9T/6dbfcKxgZ/Hi
 TbepTHplviCPoCecYcgTBgKBe1KUV84tAz7TiJcQaivdBcwOQc50Qh0WczdzATm10/8aqpxT0
 qjDKkvMe0sZej+jbm5ICSfBNzuEr+LDr0xD/IDs8Ivj+jSqCqND56Pq6ZIWHVhEpSgLoYuC
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 11:24:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 12/10/2020 à 16:45, Daniel P. Berrangé a écrit :
> On Wed, Oct 07, 2020 at 06:02:55PM -0400, Eduardo Habkost wrote:
>> Fix typo introduced in the C11 #ifdef for qemu_max_align_t.  It
>> never caused any problems because we always compile using
>> -std=gnu99.
>>
>> Fixes: 4c880f363e9e ("qom: Allow objects to be allocated with increased alignment")
>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>> ---
>>  qom/object.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/qom/object.c b/qom/object.c
>> index c335dce7e4..125dabd28b 100644
>> --- a/qom/object.c
>> +++ b/qom/object.c
>> @@ -692,7 +692,7 @@ static void object_finalize(void *data)
>>  
>>  /* Find the minimum alignment guaranteed by the system malloc. */
>>  #if __STDC_VERSION__ >= 201112L
>> -typddef max_align_t qemu_max_align_t;
>> +typedef max_align_t qemu_max_align_t;
>>  #else
> 
> Why do we need / have this first part of the #if at all ?  We
> unconditionally add  -std=gnu99, so surely this has always
> been dead code and can just be better deleted.
> 

I've removed the patch from my queue.

But perhaps it will be needed in the future if we switch to a newer
standard version?

Thanks,
Laurent

