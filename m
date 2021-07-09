Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765563C213D
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 11:08:21 +0200 (CEST)
Received: from localhost ([::1]:37308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1mUe-0002aW-Hw
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 05:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1mT7-0000bZ-8a; Fri, 09 Jul 2021 05:06:45 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:54535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1mT3-0002Qo-2w; Fri, 09 Jul 2021 05:06:44 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mj8a5-1lYTr444Av-00fCSz; Fri, 09 Jul 2021 11:06:36 +0200
Subject: Re: [PATCH] virtiofsd: Add missing newline in error message
To: Hubert Jasudowicz <hubert.jasudowicz@gmail.com>, qemu-devel@nongnu.org
References: <e5914ad202a13e9c1bc2a5efa267ff3bd4f48db6.1625173475.git.hubert.jasudowicz@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <bcedbdaf-f09a-0679-5bd5-bb2f97a9dc39@vivier.eu>
Date: Fri, 9 Jul 2021 11:06:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e5914ad202a13e9c1bc2a5efa267ff3bd4f48db6.1625173475.git.hubert.jasudowicz@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XM86y4qNVX8WzSgYTLORF9RCv1y1svwtSc08zTTLNhFxlD3Wily
 YDUnXhsiS3RlvfpSZLJjJsJgsiYHIA5+nrsKDsyV5lmW9ghJzUjEftEnwE0NVNe6fQW8CEm
 T/Zuod/R6UHSmiqgRPSNwfwgvVoRg7ibGHyIW8xa4FEsKiI6VGJYkG3M4CRauvuFdCwupYQ
 q3lXKr236VTT2UhXe80zg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:U4f8Kr7GyVI=:HX+64FJAayUQXhbC0U5640
 /oiF4csipNfz8/oLob0a7cxDXSDLVJirNHFAwXJLrMNF88Xsl8cX2QU5ZuBJph+3wCuCE/Lfv
 cCUWnHs5ax/DZFVNsrY3pxy8Cv/e8OeDtcIjNnXR5wqaRM/vcOFexKbRtcbxe+gsZzCf46JS4
 7PG8KtgO2SrirjDfiw/20PH+P/7uiJlt/gRR2qmbLW9mIPr1SQwHzZFV2WMd4nKqb+WRlFMcS
 ATe4j3AIfw3fo4SicOx+ylV/QX0InZ/kC/TKOM24W+Fh9+oQ6LnApcFQrd+hCsmibPIOy8/Wr
 d5M/5UV0un/rJsTO9m4MJXRIMw70uvlMPmQjPW7c6hd0OzbFh+yBAoRehqYhcBZYHw/MTfUUN
 l3kLDEn7LP3HjEmvvIFX8ROTTout3gSlGxFHkOtovTMaLF4ZjFUVN6gIWgfZYB2ZOJH8kcZO7
 wPKHkLmIDs/Dx2CjHHlnjAHBm1XHT4EFBv4CMhp8w+ohLvnKCj9ceQX2Jm0MWhBK0534d9lTB
 Q7vfRBPEbRK43Qv5zMYVddiLzsv27BkYub9yL8kLuOUdJfLUUAuAgEJPxhlS0+OnyHkYbIZUR
 CWkM9eg8eVMknHdvUN96rxywgiLt4UduV9ebf2DlPZ9BleKvtjEq6L1zz5KvnHK0O5Aq8N0yr
 Gyxqeqv1mgxTDgbMLcXKgRdbVER9ifZC584Zo8hDy9zzBVxNPpblQimQALl0r1C0ReupnIEIF
 zFd0ww4P6khGvVRj85VE0gWlCUjEr0b4dq5tqy4MF7Jwq9r21GZ7LWqdNOimV+mQNU/CrAoBG
 WSRaYYIfCd0oDL7gxSUygIrE9/2WGcxXHiO0DHeMh7bwBae1HeoAQyCx96j5ohxOFh401Hs
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
Cc: virtio-fs@redhat.com, qemu-trivial@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 01/07/2021 à 23:11, Hubert Jasudowicz a écrit :
> From: Hubert Jasudowicz <hubert.jasudowicz@gmail.com>
> 
> Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@gmail.com>
> ---
>  tools/virtiofsd/fuse_virtio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index fa4aff9b0e..fc2564a603 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -917,7 +917,7 @@ static bool fv_socket_lock(struct fuse_session *se)
>      dir = qemu_get_local_state_pathname("run/virtiofsd");
>  
>      if (g_mkdir_with_parents(dir, S_IRWXU) < 0) {
> -        fuse_log(FUSE_LOG_ERR, "%s: Failed to create directory %s: %s",
> +        fuse_log(FUSE_LOG_ERR, "%s: Failed to create directory %s: %s\n",
>                   __func__, dir, strerror(errno));
>          return false;
>      }
> 
Applied to my trivial-patches branch.

Thanks,
Laurent

