Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9801633D045
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 10:03:15 +0100 (CET)
Received: from localhost ([::1]:54378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM5be-0001mQ-Kz
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 05:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lM5Zy-00015K-Ka; Tue, 16 Mar 2021 05:01:30 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:57689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lM5Zr-0003BY-D8; Tue, 16 Mar 2021 05:01:30 -0400
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M42zo-1lM5ZY1hYW-0003SX; Tue, 16 Mar 2021 10:01:04 +0100
Subject: Re: [PATCH v7 0/8] Pegasos2 emulation
To: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1615345138.git.balaton@eik.bme.hu>
 <85548594-aaa1-8d3a-cedf-d2dd92f05028@eik.bme.hu>
 <b6bda254-ac3-d271-3e1b-bf73e4282e9b@eik.bme.hu>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d6d7d87b-7c7d-69e8-a7f4-e6611a4096ea@vivier.eu>
Date: Tue, 16 Mar 2021 10:01:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <b6bda254-ac3-d271-3e1b-bf73e4282e9b@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uWL5v19aBIEB7A2qhJ5u/hNDvGgycbxVe15uX/lhsMTv/29Qy16
 gI99fU+1Ndaz3eP45qLeGdZQnRhcOP637+sF2glHXjTQILbMOx8QqXqkUsDB5jNrvstvOpq
 Vu/lxTLDmXPefHeXOTUbZa/Ov0jRNcLsKYvc1CTGpkrEkIGg5rj4o0iGVZLYoI9/qxErPGA
 rrnL66tN2YXk4wNDCxSvQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zPid4bqoUqw=:mCPsRVyGMkH716UYe5RfAA
 jBqmc3+0DBYfkVzagUw4DW0/pNHv0SQ07HnJQkeIrITAc2cFL8F6W+p5k+TiL1mw8oAY3Y3fj
 2VZrfBS3ZffbUxBI+3Zr8l1zLzeN567F25EioNQxpVLayuewsVO7G641GSzNUz5LQLS9UvnR5
 BzINDPvH0AamHNFtU81nIdnxw4nwORN7zhG+8dnl6Mz5LSU2mlwLiuBQ8Tswb7/x8MubsMC4V
 r5YroaH2OpsPLDoUT3dTLxEE7D80+M/gOnjQopXBvW/sNZ1GeTaGoS5J5UCNwCFMUUJeKOx8l
 L2mex9KaCGoLJ2KpwxVGbrWKyl+YWxGpsmnUS13BKjbu2rBXd6K5Hcrl+K4HHXLDGPuMKIQmS
 +CfTKYBdN+XytCVjoRjsDeZYrPQHdBpIUQKNyajr/TW12s68/8yHCwaeOdqv+KzLhDTKvXViq
 alNN/5/QsQ==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 f4bug@amsat.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/03/2021 à 13:33, BALATON Zoltan a écrit :
> On Sat, 13 Mar 2021, BALATON Zoltan wrote:
>> On Wed, 10 Mar 2021, BALATON Zoltan wrote:
>>> Hello,
>>
>> I've started posting this series well in advance to get it into 6.0 and yet it seems like it may
>> be missing it due to organisational issues (no real complaints were found with patches but
>> Philippe seems to like more review that does not seem to happen as nobody is interested). Looks
>> like David is waiting for an ack from Philippe but will be away next week so if this is not
>> resolved now it may be too late on Monday. To avoid that:
>>
>> David, could you please send an ack before you leave for the last two patches so it could get
>> committed via some other tree while you're away?
>>
>> Philippe, if you can't ack the vt82c686 patches now are you OK with taking the whole series via
>> your tree before the freeze? That would give you some more days to review and it could always be
>> reverted during the freeze but if it's not merged now I'll have to wait until the summer to get it
>> in again which would be another long delay. I don't think this will get more reviews unless it's
>> in master and people can start using and testing it better.
> 
> Hello,
> 
> Since David seems to be away for this week before seeing my mail asking for an ack from him, now
> this can only get in by Philippe or Peter. (David said before he'd be OK with the series if Philippe
> acked it so I think that can count as an implicit ack and it could always be reverted before the
> releease.)
> 
> Philippe, do you have anything against this to get merged now? If not please send a pull or ack it
> so it has a chance to be in 6.0 or tell if you still intend to do anything about it before the
> freeze. This series was on the list since January and the remaining parts you did not take are here
> since February 22nd and the version after your first review since two weeks so it would be nice to
> sort this out and not block it any further without a good reason.

Pegasos looks like a New World PowerMac, so perhaps Mark can help?

Thanks,
Laurent

