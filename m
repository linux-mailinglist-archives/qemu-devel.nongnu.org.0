Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95C247B1A2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:52:36 +0100 (CET)
Received: from localhost ([::1]:38728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLtr-0004oi-MP
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:52:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mzKUC-0002oR-9X
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:22:01 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:43439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mzKU1-00080I-DI
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:21:57 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MbAtM-1mSPi917Yu-00bd7P; Mon, 20 Dec 2021 12:10:21 +0100
Message-ID: <cc6c564c-7faa-d95c-9bb8-ea84a54eabeb@vivier.eu>
Date: Mon, 20 Dec 2021 12:10:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] hw: m68k: Add virt compat machine type for 7.0
Content-Language: fr
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
References: <20211218114340.1856757-1-laurent@vivier.eu>
 <87a6gvr8p8.fsf@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <87a6gvr8p8.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sEd4U+xTpp77S08NoZ1YnTjsj+xo03S+ZSnAl9j8MnUWlrWHXUN
 dB3T4DS/jGUMoPor7yYvkYruL0pkFh0+lvkIfNKrRQuPg0PViEty510PISL56HFPG3OkRTd
 w4j12OjICB0Y34VWvjBI0ZgI2VNKjKxzdw+QRR1P4Jmx9nDvsJurJfSFtCGmutmAQ94dE7w
 wDQvsho3UgCH+dJ4R6X2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1nvG7DTjthg=:mpcXQ3bfK2q8h7GsFcdYBo
 Kp1cEgDt9WuqFITiKTBaJ3YbdgXU33tRIM95+FmccSu8PxU10W4YtfNcThjNW3YDeI1bDYlOP
 d4FMt5CKimR+x1C/cz9Eu1s4bq2K7/fIzMXql5b+q80btQjztlcR+UNDKsG/KtL0Iw8R2XZew
 RawaP0dgEbbWtWSR8WjuKuyD1h/uJRPZGnaJtcqjN93iw8KjsZzLrlR/n99GExHw2VW/3mXKP
 e1NqP4JJDQMCvJ6CQVtMXVwLEkE39fPU0TMK8AtuinNvQRpLuyTQhoN4hKhaf2w4CMHijNkty
 dXa00p6eqalcrhVcGHxI/Nk5t9O0qiLj7/FuiApYm++30oeDzQEyJX4mUz6jDOEoh24DCDTjL
 BZjovTgTWWBwkcYcKR13GkV21lZuEDj9cfm0N/y9IOO5Y7u7hkAEEwcLkYv1fc8kS8gb3M6to
 /t3/UOd9PQ8HRMzo6O0HvxNU7c3hVjtEp0UHybk/Mkjt4C63F/CeH4r/DRADk5MXjbF1dMVtA
 RICWk6AlYcPt+Wcg9LzJpCKISwYA3+f5sArZ/h59of6qUpo8or6Uox38wiMk7+gex9Rq0s0Qy
 jLGgyUBnI4sRX4NJ2KwILS6KwCUCbOqgex5T/BRrrLcTVgrTTzad8BJbjbUCFa3DURI3RX74K
 Rxm8Wph7x1qAxlPTaiV6P2jPKlfDJnBp/IMBOhmWsrn6vwn+5F8i3FNDAJVaiqnByr84=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.608,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 20/12/2021 à 09:17, Cornelia Huck a écrit :
> On Sat, Dec 18 2021, Laurent Vivier <laurent@vivier.eu> wrote:
> 
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> ---
>> Based-On: <20211217143948.289995-1-cohuck@redhat.com>
>>
>>   hw/m68k/virt.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> Oh, I didn't realize we do it for m68k as well.

virt-m68k is only a toy and is only used by debian for their m68k buildd.

So there is no problem if you don't manage the update, I will.

> 
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> 

Thanks,
Laurent

