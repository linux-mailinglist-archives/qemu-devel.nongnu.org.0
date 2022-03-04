Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E95BE4CD8A6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 17:11:11 +0100 (CET)
Received: from localhost ([::1]:42264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQAWN-00080F-1n
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 11:11:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nQATb-0004wM-JS; Fri, 04 Mar 2022 11:08:19 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:55355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nQATZ-0002Xu-SC; Fri, 04 Mar 2022 11:08:19 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MUXlA-1nZ0912rJ2-00QWMl; Fri, 04 Mar 2022 17:08:07 +0100
Message-ID: <259d696c-9492-fb63-a2a4-1a66a8792520@vivier.eu>
Date: Fri, 4 Mar 2022 17:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: fr
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
 <20220304152704.3466036-4-marcandre.lureau@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 3/4] Replace qemu_gettimeofday() with g_get_real_time()
In-Reply-To: <20220304152704.3466036-4-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3UHfqED/lpRq7JETP8REsSZerNKjVSyfS2q0TTQa6kxEaPdyeun
 20ax0Q21H0B6N1AjBC89To/DtiG8DegwMn39QRcWlpITbBXgTWa3irjKeYxKtSwWWrNiV/I
 vTtLpGiRDkMZ1j2Ws454B9ifrr05Z387uNS4xph+yQTxMFfwAN6zAGMMgzL7JDgI4sx62o+
 ntqSecWstNGxBR7/gOMOQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZC0q9Zc+9EY=:D7lJMZaXINXlbYe/C0eoVp
 HHB4twKxRRdmFU9IEAfUm5ofKrEI9H5/bYII/04nD94brseQ9GikUYnnca53l7tBE4qr2F5wo
 +JMzFU6JqRzLRO8kxSAt9MjSsYzQLXtomUs6NqzfQXCYnPfNUS5CM9sEXEvodihgnLAWVnE7c
 6WWIhmiPLKBHJrsuoyRfyjgIv5+QjC7pe5g6YowLjh3G0RzQTg98g2Nqcd/hyp9n55injssxc
 Qj841yzDRXiyjzI2U0gcVFPsTRZndXHAUnvyn6jI1vgR3x53xKY3zEOfw/cXg5Hf9YrQgTiv5
 2Zqbbax71JqeNgPSJfPtRURZiWTHUvyt587G0dfbS54IwTR/qM7yn4FsxJsSDB4ym1bftR3l0
 gehsdOHlkDfDWXhCJCdgmFImU6LH5M/s3/8VVpHsEaRCC1rqXY2Np13FTXkjqkKhWA8E2IEhp
 B5AnZY+w4S8R9dqQAge8ZIVnS3dI2s7+M5+AbKIjnyKonja6k+ZaSlIayQ7oM373cNHt9sLmn
 lWX/U9Y0efTZh6GMT37xFf3ntkP7iJIT7pTwNgCDs26B2OWn4rnho3jE09m7caqVBOZhJH9J5
 69vFZGFdeD6KzkJjuXKIXdIDFDfk3mNLDvry6yXdPZC/v0K25PcmIFUdWS+0hzK7pv5SbLC0w
 q6iqwH7e2LUNcJ0Y3A5RyQDUVF3e/07q/3zZTrKUH1PsSxgVOq+AAq27nkEIgBKLRa58=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Marek Vasut <marex@denx.de>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Chris Wulff <crwulff@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/03/2022 à 16:27, marcandre.lureau@redhat.com a écrit :
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> GLib g_get_real_time() is an alternative to gettimeofday().
> 
> For semihosting, a few bits are lost on POSIX host, but this shouldn't
> be a big concern.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   blockdev.c                 |  8 ++++----
>   hw/rtc/m41t80.c            |  6 +++---
>   hw/virtio/virtio-balloon.c |  9 +--------
>   qapi/qmp-event.c           | 12 +++++-------
>   qemu-img.c                 |  8 ++++----
>   qga/commands-posix.c       | 11 +----------
>   target/m68k/m68k-semi.c    | 22 ++++++++++------------
>   target/nios2/nios2-semi.c  | 24 +++++++++++-------------
>   8 files changed, 39 insertions(+), 61 deletions(-)
> 
...
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 75dbaab68ea9..3311a4ca0167 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -138,16 +138,7 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
>   
>   int64_t qmp_guest_get_time(Error **errp)
>   {
> -   int ret;
> -   qemu_timeval tq;
> -
> -   ret = qemu_gettimeofday(&tq);
> -   if (ret < 0) {
> -       error_setg_errno(errp, errno, "Failed to get time");
> -       return -1;
> -   }
> -
> -   return tq.tv_sec * 1000000000LL + tq.tv_usec * 1000;
> +    return g_get_real_time();

now you return microseconds, before it was nanoseconds.

qga/qapi-schema.json:

##
# @guest-get-time:
#
# Get the information about guest's System Time relative to
# the Epoch of 1970-01-01 in UTC.
#
# Returns: Time in nanoseconds.
#
# Since: 1.5
##
{ 'command': 'guest-get-time',
   'returns': 'int' }

Except this problem:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

