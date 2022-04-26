Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D966851092F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:35:47 +0200 (CEST)
Received: from localhost ([::1]:33880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQyQ-0005nk-U4
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njQBY-00037z-4I; Tue, 26 Apr 2022 14:45:16 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:54787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njQBW-0000gf-DA; Tue, 26 Apr 2022 14:45:15 -0400
Received: from [192.168.100.1] ([82.142.9.138]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MTw02-1nJbrJ0s6M-00Qzte; Tue, 26 Apr 2022 20:45:11 +0200
Message-ID: <3fd9f0a0-70d6-4b68-b8ca-318f69f4b1c0@vivier.eu>
Date: Tue, 26 Apr 2022 20:45:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] Fix 'writeable' typos
Content-Language: fr
To: Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
References: <20220318173038.3350098-1-peter.maydell@linaro.org>
 <CAFEAcA_5=5uauENSDRYQdaXJQJ5pnf9eUBHicA3LWjyScZ2SuQ@mail.gmail.com>
 <2eb3f904-1b0c-d5bf-18f4-064f8b663cf6@weilnetz.de>
 <1531213e-b869-d760-2f84-89b9fd4f7467@weilnetz.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <1531213e-b869-d760-2f84-89b9fd4f7467@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9B0nCNWCPXsQsFBh/52/C+E+LmuamsvQIhABbNETzLCjy7I4uK5
 kypyPV0/zJiU8hKFLKLGLUndkG6hO6uq3bBVfPDH30UdRWCj++kYS5/XT1Bx31FTpacfxkX
 1MXXIAMSECzHLcOY1gOWnC5nTbNN3MUgffPnHsTNVjCmsVWltSX/R0+lsIvmlvV9+irWCsf
 60uRPqpYJzVPmhsRSBK7A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1pbch7GZ9MA=:SHDAx8ArJGd5yu4brYnJBW
 2AvTcTLU/P1EwJgugr2hRANhNaIzhMN6NdHpPLpIA1MXOec7VlGao3nt6o7H5ozcP3GAyKx3O
 l48i7b2oey/aka6qCfadAG/WD80MXN+AAbqXBJoWwBGlcGZUdy5AvRsV9hmVWwcfx+6yXRrKf
 vdEbvLb/MCS37qMTHHW1xfX28lO9Bq5J46JD9lt57J4a2jsSn8CR48wAB7izDgn6VKm5Xm4Z1
 gHOZFKCbmsSeBpEg7ng4JUKUvqrOpVvoxIcJfnRevbDKj6g49tybgJxvjYZbx9Ebncd6k2TAe
 CG4FOBinAyO44NaBR9wX7gwJQGkgyQD46oivwwSBtRmwGrlmF65ayt+k4Ohlsjzh7y3WVPGoO
 msY9Od4H8mbLZQZr4MeKFCmoJNRYApRN5BaYzqzOqYYieANhkVoZiMiMTa9A18XCpjfTGb8jg
 uADtlYh6KR5rcASRr7b9UKzn+Zr2NnYviAm48lAedplni6Xxj3RoVUORnQUnq+IKaA4VuKeRI
 9FFLccBqV43fg2M5psHUNxnPRERgqh0yl7GJL2H+uhNcTr7U26Pzq6YrGCCfyvHbfdAqopfz+
 htUDB1YOs41EQewI01cz7DzJvAFVrIigxsDFEY6ugMDSh4uR1mPacOdSmBIFTtuYFiEd7p1w0
 003V8ypCKjrb+pHSD1xRKkynysB/b9V2Fvz9t/PFdx/5EBKDMQisrtEyYedgrcWkulIE=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/04/2022 à 17:19, Stefan Weil a écrit :
> Am 26.04.22 um 17:15 schrieb Stefan Weil:
>> Am 26.04.22 um 17:04 schrieb Peter Maydell:
>>> On Fri, 18 Mar 2022 at 17:30, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>
>>>> We have about 25 instances of the typo/variant spelling 'writeable',
>>>> and over 500 of the more common 'writable'.  Standardize on the
>>>> latter.
> 
>> You missed the one and only "Writeable". :-)
>>
>> It's trivial to fix that, too, so maybe qemu-trivial can do that
>> without a v2.
>>
>> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> 
> ... and I nearly missed several WRITEABLE.
> Maybe those can be fixed later.
> 

As I have missed this patch during my collect for the today pull request, perhaps we can have a v2?

Thanks,
Laurent


