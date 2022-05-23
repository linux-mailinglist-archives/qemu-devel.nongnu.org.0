Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA875309EB
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 09:23:03 +0200 (CEST)
Received: from localhost ([::1]:34474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt2P8-0005Ix-HZ
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 03:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nt2IJ-000395-M9
 for qemu-devel@nongnu.org; Mon, 23 May 2022 03:16:03 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:47687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nt2ID-0002Pu-8t
 for qemu-devel@nongnu.org; Mon, 23 May 2022 03:15:56 -0400
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N6Kl7-1nmKEu3yo5-016fGT; Mon, 23 May 2022 09:15:50 +0200
Message-ID: <2d3f8d4a-6c9f-824e-56ec-edd76f42b1d9@vivier.eu>
Date: Mon, 23 May 2022 09:15:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] linux-user/syscall.c: fix build without RLIMIT_RTTIME
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: qemu-devel@nongnu.org
References: <20220514143434.2093641-1-fontaine.fabrice@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220514143434.2093641-1-fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0kF6Ulb+qu9gVembbzMXUIGVhS36p+zgyEtW4csUiuy7GNQjeA/
 ZNkyTmXYPilwGRnbT4GIqIahFcTWjoACF4X+qJTl3XYkQmbG+9Iy2M8joP7GU41ohCKvsP5
 x3UEuk4ZqNM95LHGDLbuYeLhUzy/KD4TVoE13W+kOsJ0Celv7SxXvh6PkxhLVYgX3qFBOjc
 MLvwUSAxfW/kLzfvAcIvw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zfVRce5V4UA=:lrJy0CD6Oz5q6fL5MfMhqh
 2LsYDYXR1cBktpnNlDshk2aXH3/YG7qm98MB+zgmBoa5J7e7rQYYgfMRF304SngeGXwPUdXNh
 WZIxtG+H4y5ftyiSqPMPI8hYtaomGijdWBhNsgzcK2pAq/Pao2mj9PEQGdyVx4NHGtG9syDKN
 s53YKpEn30VJUC/u+/iPcVCc+9cTORvdujaMR91VhM7akGzUJESDitsikyBmLa3u8TGmpD2sD
 V9Kk7egxG7HB5+/HtqVJCmNTTI5yqp9Zey0qBlmi2EFgWJc7kSzR4n8isj5yFz5IG/gaoqqLt
 Q3rFwAw298DrrRdV8fRTp0EoRq+MH7/sXrLX5wXb45bWvK7C+NrSs6pweZ2zchcWufVMrc8sD
 yg4OFz3CffredYYlQ2oaqJH2IibeKkw5R2H7aGtZXr0iCyAB0vtmJ+GxOg7UvzKE+ohtSipdW
 /l9jnV71hYPeysMOXcWrXtvxoJCpXPJGsFIUf/CuP0r8Tpb/ATYb16VEpVERFz6wXcgrQT9Dh
 SEQciDvwOK57gXdH6YcnZAZ3ERNJeSq7WXOdBbudD98AID80/OkMIgPyfNKA80Sv82zYSQJPq
 Tu36o9H0wq1XzOYQzv4qZr/Zv6QFh/52u0tAfanmFPlpwBcUeddTNQwqB+6KNsMTnl7ojKf+5
 keI+/ncmkPNdDZ/Hj265YOLfjyJ9d5PGrxRZ9FlDAcs9hyknPqjdmk7LlRvm7Iscq8Cg9UjjB
 MwIDCVF/U4zjKZu6zyMmjNBvMAzlW/vvEf3bFw==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/05/2022 à 16:34, Fabrice Fontaine a écrit :
> RLIMIT_RTTIME is not provided by uclibc-ng or by musl prior to version
> 1.2.0 and
> https://github.com/bminor/musl/commit/2507e7f5312e79620f6337935d0a6c9045ccba09
> resulting in the following build failure since
> https://git.qemu.org/?p=qemu.git;a=commit;h=244fd08323088db73590ff2317dfe86f810b51d7:
> 
> ../linux-user/syscall.c: In function 'target_to_host_resource':
> ../linux-user/syscall.c:1057:16: error: 'RLIMIT_RTTIME' undeclared (first use in this function); did you mean 'RLIMIT_NOFILE'?
>   1057 |         return RLIMIT_RTTIME;
>        |                ^~~~~~~~~~~~~
>        |                RLIMIT_NOFILE
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/22d3b584b704613d030e1ea9e6b709b713e4cc26
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   linux-user/syscall.c | 4 ++++
>   1 file changed, 4 insertions(+)

Generally we prefer to fix this kind of problem with:

+#ifdef RLIMIT_RTTIME
      case TARGET_RLIMIT_RTTIME:
          return RLIMIT_RTTIME;
+#endif

Thanks,
Laurent

