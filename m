Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C121934CBEB
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 11:02:44 +0200 (CEST)
Received: from localhost ([::1]:43432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQnnH-0000yz-8f
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 05:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lQnl3-000099-Qe; Mon, 29 Mar 2021 05:00:26 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:50067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lQnky-0008Kb-Cq; Mon, 29 Mar 2021 05:00:24 -0400
Received: from [192.168.100.1] ([82.142.14.126]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N8X9L-1ldfqQ0Ou1-014TtZ; Mon, 29 Mar 2021 11:00:15 +0200
Subject: Re: [PATCH] linux-user: NETLINK_LIST_MEMBERSHIPS: Allow bad ptr if
 its length is 0
To: =?UTF-8?B?RnLDqWTDqXJpYyBGb3J0aWVy?= <frf@ghgsat.com>,
 qemu-devel@nongnu.org
References: <20210328180135.88449-1-frf@ghgsat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <848b6c86-25ce-d5ed-4402-6df72e23455a@vivier.eu>
Date: Mon, 29 Mar 2021 11:00:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210328180135.88449-1-frf@ghgsat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nfADt0cukfDdgxhjYGhKlPV+OlEZczQyn05EAPHHfHHx+clkh/x
 eNvMxwEKyImdPZ8HWVthWYZ3BQeXL5j9D/dwQJshNS1xF6K45JKjSwGISOSwaOYiOWPCsvO
 LA9argtG8hyk7kseE0rjxcjriWdGXnsAStIQ8zfVx18nCdEXJJKB12mpOYjIwvbDYyiRYnE
 yfP6syy3kfUMkmKQrWdCA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4MKa3nKA12c=:CzA/EGHQPr0RtFr8wgXU3b
 PQfrtyy5rQL16CHS4+8u77GBwcL+0WR1GmdcdPMRjV975d3J04EvLNaCslc+/1xWfdQba2rhX
 ebgfeunF2uodsBpca6X4NGki/i/LjUgvKTs+7qQUmvIPec8yLrgUOk8xXEf5cTWJsjskjoebw
 pqc652cBZPqoVZENZ0AFD89iVicKUGyG985z/9JhdeEiMA+YcKyRu0n2ipuEXLWOZPXXUOVJH
 Xz8Xt9MHJhTaLJIhuwX1VUcknlugIndf1hvpDZe2tR2svCc1p+OVfKkjUrqHBESYd1DzCKBB5
 87nTW0nkencl3DYp/rLpPix0VxE+g/VckjqJZl84O6TzfkE6DxlbyypARU69lIVVn2/Uk+Gdu
 Hom9K0ettvugdS6nwrb8GXgM5J3dqWtg5jMmkiqayM/tbk/TJ8yg0Gv9MTyGm6YoezNKPw792
 hl0HL5QMnnoB25xJgDJbA00Wk7eEdbT+4+3Vs4OR9vMCQSlbtet6
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 28/03/2021 à 20:01, Frédéric Fortier via a écrit :
> getsockopt(fd, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, *optval, *optlen)
> syscall allows optval to be NULL/invalid if optlen points to a size of
> zero. This allows userspace to query the length of the array they should
> use to get the full membership list before allocating memory for said
> list, then re-calling getsockopt with proper optval/optlen arguments.
> 
> Notable users of this pattern include systemd-networkd, which in the
> (albeit old) version 237 tested, cannot start without this fix.
> 
> Signed-off-by: Frédéric Fortier <frf@ghgsat.com>
> ---
>  linux-user/syscall.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 1e508576c7..9b7556a9a2 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -3025,7 +3025,7 @@ get_timeout:
>                  return -TARGET_EINVAL;
>              }
>              results = lock_user(VERIFY_WRITE, optval_addr, len, 1);
> -            if (!results) {
> +            if (!results && len > 0) {
>                  return -TARGET_EFAULT;
>              }
>              lv = len;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

