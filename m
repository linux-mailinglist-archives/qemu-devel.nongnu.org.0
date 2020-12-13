Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA602D8F0D
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 18:22:42 +0100 (CET)
Received: from localhost ([::1]:50592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koV4z-00036O-JT
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 12:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koV4F-0002aY-1g; Sun, 13 Dec 2020 12:21:55 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:54489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koV4D-0000qF-G8; Sun, 13 Dec 2020 12:21:54 -0500
Received: from [192.168.100.1] ([82.252.135.218]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M8hph-1kkOKr1UuH-004jFZ; Sun, 13 Dec 2020 18:21:48 +0100
Subject: Re: [PATCH v2 2/4] Makefile: Require GNU make 3.82+
To: Thomas Huth <thuth@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-devel@nongnu.org
References: <20200825202755.50626-1-r.bolshakov@yadro.com>
 <20200825202755.50626-3-r.bolshakov@yadro.com>
 <1ff85cc3-40dc-98da-fb18-a1b3d134d7dc@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <bc560d06-2b8d-3ef0-b9e6-ddaeb58daa13@vivier.eu>
Date: Sun, 13 Dec 2020 18:21:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1ff85cc3-40dc-98da-fb18-a1b3d134d7dc@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QS37zHxTNMO++5oL9LjdLkW0UdA9FtIm3XcG0la0lkuTW5MSt44
 3aEPsDwok/JLSVwAJm3rXj9ZqrW0M0QcYAkG0YpRcxY/ex+t1EssA5ZthMUBQKJINwyLeoe
 nMOog7QQ3Kpwit0PUY6R6hCHEd52x+/pGxD+FZfOLjA9SX0xfIL4RWF18vynva74fVHI+X3
 ZvOWtbB68pnBD50Jn6jUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qMU6U0D3Ius=:WAqJTUbozzBz2+alpYVj9C
 2oBQvDuDlLjigIDt5yGAmRxVUGyq54miQdNMwHxzBszBGjiJ/R9YfIdYBG37iL4iEVRJ9Mpcg
 6oazttPEkf6EW+/AgFRl9ei4zb4foE9V7/DxyuEYrSYNrnEUcRnakuMlnVWZr8T6txEG6+iuk
 nowFDBmPLP5IxxG3jR6hiHIsgYitSMypFXtyKiJlHRj+HQBq8W7tQC4GsfbOnAKbF6WovrjUf
 /OBjEOQNQk+RvLiinkF5bhvWnP06XtRvmHCvzO7Di8ihHUCxL2LVEoJYByU+xKo5ai+DfYVCT
 CKfJpb3J7wBZYl568mTJ8Mtx56lSi8scly8bGz7dHE9Am+gxlzQpzKRbR8kk6yN3r3giUGSur
 2VGj5WScZxb9WNA0JmEEcZWsDUC8/Zu5/jFh1sEqqUD94pzl96TkTOxZRwlPORig1dVMA5Fy3
 D2iC/C7iyg==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 12/10/2020 à 11:47, Thomas Huth a écrit :
> On 25/08/2020 22.27, Roman Bolshakov wrote:
>> QEMU build fails with cryptic messages if make is too old:
>>
>>   Makefile.ninja:2655: *** multiple target patterns.  Stop.
>>
>> To avoid the confusion it's worth to fail the build right away and print
>> a friendly error message.
>>
>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
>> ---
>>  Makefile | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Makefile b/Makefile
>> index 81794d5c34..b4ebf3e30f 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -4,6 +4,11 @@ ifneq ($(words $(subst :, ,$(CURDIR))), 1)
>>    $(error main directory cannot contain spaces nor colons)
>>  endif
>>  
>> +ifeq ($(filter undefine,$(value .FEATURES)),)
>> +$(error Unsupported Make version: $(MAKE_VERSION). \
>> +        Please use GNU Make 3.82 or above)
>> +endif
>> +
>>  # Always point to the root of the build tree (needs GNU make).
>>  BUILD_DIR=$(CURDIR)
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


