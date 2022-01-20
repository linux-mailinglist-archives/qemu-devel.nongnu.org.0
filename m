Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F80A494C6F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 12:02:53 +0100 (CET)
Received: from localhost ([::1]:35486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAVDQ-0006vY-A0
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 06:02:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nAUrh-00079s-NY
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:40:25 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:35773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nAUrN-00089E-MM
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 05:40:12 -0500
Received: from [192.168.100.1] ([82.142.13.186]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MCayD-1n1w0D0FBz-009dBb; Thu, 20 Jan 2022 11:39:58 +0100
Message-ID: <64abb96f-6c84-8dfb-f645-93d450d0909e@vivier.eu>
Date: Thu, 20 Jan 2022 11:39:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Fwd: VirtioSound device emulation implementation
Content-Language: fr
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <CAAQ-SiOU5vkcVODOvBEf=PXzRDQbhzJC6ZU3wLpnRzhD58cuGg@mail.gmail.com>
 <CAAQ-SiMpZZ3yVCRjapCuResP38HFmtykFuLvpwH_23kEPg6v_w@mail.gmail.com>
 <20210215143934.sz6tdtoaaffkvla7@sirius.home.kraxel.org>
 <CAAQ-SiO_cTe3bQKDQ-tyeUU-DqTSf=1kRUcc+a=tktZb0ZhVog@mail.gmail.com>
 <20210416113252.km4w72vnruv6s2oi@sirius.home.kraxel.org>
 <CAAQ-SiOSw9u=yFrakjjjTvozpAW3nxhC+QeW7wswMSzSeZ_AVg@mail.gmail.com>
 <20210419131050.bltknubbkd4du6ti@sirius.home.kraxel.org>
 <CAAQ-SiMf=BV-HUudRayZkRPJjmkYWuiBuKqYHHLzYjcFnPOgLQ@mail.gmail.com>
 <20210419135627.dlerwnswhfxt6ciz@sirius.home.kraxel.org>
 <CAAQ-SiM6uWUgHTS5PQ-hSkuXNOoKC7fw6Y1ZHhJ0MCUE3oaBqg@mail.gmail.com>
 <20210420071304.gmndase3r6mwp5yt@sirius.home.kraxel.org>
 <CAAQ-SiPPNK0xqnPPSjNZgwQCs+Vj0_A5koq5xK8HzhZKDgqVJw@mail.gmail.com>
 <CAAQ-SiO6-Ay9415XsLe2Xd-KXog7i2Xvh0kX0h1uBgtj-L+=Ag@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CAAQ-SiO6-Ay9415XsLe2Xd-KXog7i2Xvh0kX0h1uBgtj-L+=Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:R17dJC1kSIBuI2PH90NGDrQGNi/cj18mmLBuIXEeuzbY3ZiivCY
 owkKYKUdLCRzmoZBolWNQZlNpWFYh6FMvc5g3lU3WD/4XjbJrLF/N5FVRKmMISOADqqeAW1
 FKEecxW9uyL4TrA7tye2Hh5iGemx5FYl+4lAujd01sT5PBS1LToETIMgc+DZtXTbZoDBQLv
 Oll8U/HSeVn57yDyywXjg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nySoFwYW52o=:nUS71efnmHIn7wfyXXTprg
 Jl7lH0LFfp1Y4cYyBvPlMo3xwhgq5GP/NZaBKuL+LcCYzMUR64+AdI2tRLwriPDc+oVN1uMyi
 GRj4X28TQ2Q//Jlal4FKFqODR9RjJzOxwUtGzPT15HkoQiP8yQnYIGFhnYt7TS8OnTazssYlV
 iBNrAjCty49cucyRy/20BBKGImMA9H/anWDe6VqhVlFtD6TCeuOZ+SYD6lXb8ddwnct/PvQkH
 k/iNGW0cf6V3pbLh3iJUNkednFjSmNNm8KxzSwNXiLt/t7e3TcVPX4A9Eldnf3cxXShWDxf2B
 9r4GiW5hHiDO24MeoPwPisu20rTDFEZr5W0v+kfrh3vH6+Hp+1pYT9d22aPJVhP++44ljv4Xv
 9B8q0BrpA6aCEvRXVmxwXgBZigykae6jwX8O2VxzpkMWFyzD+Dhk2UVmKO0ApzKX1MbXtu6t1
 Ppitz0OWsGLBnu16/xri2CZHVqVNSTSDQwVUTlqXfU+cjgozpHRWpd3VPYAvoyZ1tI8DzGAYA
 6InS1PAhGpxhVdsr7ve82cIfSsRFGLRtLVyNQX2WXMCetH5g2zH4KIo0uxH3eusUFIrf2Y2FS
 sPMeYVIz6QcBGRWxti1/URfz40MYSQurnfpIMSFv7CD65wgadAfJsPGoAy0xweT9pcOYJtVYK
 JCdUWwL1gVXUvtOTr11nm/tDREJ/tGmp0EN4p8QyGJa8GEt5OXWaN9eHGWlGynBlX1bg=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/12/2021 à 06:52, Shreyansh Chouhan a écrit :
> Hi,
> 
> I am sorry for the absence of activity on this. A couple of people very close to me died, and I also 
> got busy
> with the linux kernel mentorship program for a while. It was a weird year. But I am back on this now.
> 
> I have the basic functionality of the sound card working. I tested it on an ubuntu vm and it plays 
> audio just fine. I'd like to test
> other things like changing stream parameters and channel maps. Also the VIRTIO_SND_PCM_F_MSG_POLLING,
> VIRTIO_SND_PCM_F_EVT_SHMEM_PERIODS, VIRTIO_SND_PCM_F_EVT_XRUNS features aren't implemented yet.
> Implementing VIRTIO_SND_PCM_F_EVT_SHMEM_PERIODS hopefully shouldn't be much of a challenge. We can 
> send a notification
> when we have processed period bytes (if I correctly understand this).
> 
> I will send another rfc patch series once I have channel maps and jacks ready. And one more when I 
> have these PCM features
> ready.

Hi,

I'm trying to test your RFC series but I have a core dump (using alsa-utils speaker-test), do you 
have an updated branch I could pull?

Thanks,
Laurent

