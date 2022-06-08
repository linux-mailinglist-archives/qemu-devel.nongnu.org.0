Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E01542BB5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 11:42:06 +0200 (CEST)
Received: from localhost ([::1]:38242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nysCR-0002r4-Mp
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 05:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nys75-0001wx-Bi
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 05:36:31 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:33907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nys73-0007tO-OC
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 05:36:31 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MWixU-1oEB0a1dOK-00X3RL; Wed, 08 Jun 2022 11:36:24 +0200
Message-ID: <56b31126-41c5-e7b6-5b32-2b64ba1cce67@vivier.eu>
Date: Wed, 8 Jun 2022 11:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 0/3] target/m68k: semihosting cleanup
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220607222616.717435-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220607222616.717435-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wCspNcgp64/Bm/UVS5cb+ByKGda/FmbtQZcUrCMzgB0iMPHxBBB
 f5MUcWOk2eBpkH7Bf+4HsIUkoQzE/rZuIhANne/74li+cwadth5QtjgQ+lbGUxDtm9djOOc
 W35Rhby8b/TVCnmnMGZ+M98F3c/KLZXP4oYKT067ZNozZEZJ4toYDvHZ9N5QPXZo1iGaBUn
 bDwQT/5sx3VBin01AIQLg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fgoLodf4CY4=:4HK5LEfleNTHf4KB+EfDBt
 71t/ubnohHu+j5e7AAL47ai08X8RjA1/Jrnuff0zjgwRp3hy+v/Pk3P1rqZVTPwwngIqRDppe
 owYnDC4ywrkt7+GMHsFYnJYPMvw+xBHEZjvbKR3UcGyLsFooNmQtiWbxtlpHs5elOvEjflA/v
 xdXH2cR0Ud+IkxU6GChPtrTt5+sTNi3vGNlyD/MRUyWHsOGfD96+kjQ1PFH1J1hTR77iT3+M7
 YBTLtFzpBKWnwx44lc25Nbngo4HJuIL6SlFo0Hii9IPg80TTiB+PmbvxdIEyUIF1Ib04e1FJN
 pnRfzi71xoXJ7lwRIg1bzNZfaPoQV4hhzqjQl0aAMW5VSp1SBpDrKYvB4vgUriqLa5cKVqfU+
 oHtPEaKuw6VBjvEIqtaW9c1g8TTgXJX/MB2IW/WXobgebPmqm/XbUpaebWUjQHc8N3vWsrzbI
 qH9zhUFU6mem8Zw2R19tXeAbvaWisTKEAK280W8W4FbNVoCPkIYAw+4LeN3CvzLDRX5JySS7H
 qYH6A1E4baSz4bRRzSg6Q7aNg1Y+/Zah8f1NW3vYME3muAePSqnxkK/LltX+h7LmIM0bzRLfS
 zC8Ux5BhACIo5JsPPn5PyOqeZnG72WgKPvf03sybhC4NZyMjocFX3QWzaMElvU/rWjlYhdFzn
 TMsxyk6L8FWLDRE9ftjCs2TB2x4NGYi2UTSA5YOS0WLigi5Vh6YRA3Tug14igUcESiyJTTLTD
 USMrefug6G0KIcBig2BVEF8Svj47s2GJx1cKDA==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/06/2022 à 00:26, Richard Henderson a écrit :
> Based-on: <20220607204557.658541-1-richard.henderson@linaro.org>
> ("[PATCH v4 00/53] semihosting cleanup")
> 
> Changes for v4:
>    * Split out of v2.
>    * Convert host errno to gdb errno, which for m68k is guest errno.
> 

How do you test semihosting on m68k?

Thanks,
Laurent

