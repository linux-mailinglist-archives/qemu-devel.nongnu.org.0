Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A31D4BDB48
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:29:02 +0100 (CET)
Received: from localhost ([::1]:58502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCUf-00064k-75
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:29:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMCG4-0001Yd-93; Mon, 21 Feb 2022 12:13:56 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:58183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMCG2-00062N-5A; Mon, 21 Feb 2022 12:13:55 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M3lkT-1nLNJB1B7j-000xQ8; Mon, 21 Feb 2022 18:13:46 +0100
Message-ID: <3c91b56d-864c-4b58-b94e-27d209156a58@vivier.eu>
Date: Mon, 21 Feb 2022 18:13:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] configure: Disable capstone and slirp in the
 --without-default-features mode
Content-Language: fr
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220221090647.150184-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220221090647.150184-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Bxw42vZjpdwzh7wNLuomxjH0NF6Kirq8WcQ26ToLgA1yEnc6bJy
 5iukTk21Wc7CIHq9rfU4slj+TWGFTbTQMnAIyVPJ7ESTyCRA3gFklUmKPlWfFKtVf5bfm+Y
 YnPgyAiDTkkWHYHMXaR5IkarhcBSfqOFlFIAnpWg421+swAj4XaVamU0J4SsQ9eRwUes6NF
 yUPlDRtfGHIHmjZcGoc1w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Cbw+7c/l/oc=:b6av6/7GFadkXpilVSYbUf
 KQ/L7xaGh6xR9vMFb0usASK/42PkyoArgZHseZ5qhlQWvtg7oLiHk7kmSLZUNZxuTkO41jeWG
 2iN3jYKDHCAEj0rm24MPqkeZqGYUuy9fw1dCvvRHqBqwW4dUOIqJLKYBPlqRbbljKScWEQgA7
 hqKRQR9HnqIa05Nd113dQcxwMFUme8GreTS3M1d2WNq04XXqKAXWyjPMmMYlSxw6bFIEIfKHM
 IdQFaibohtJmWRG+UD/iVMnOAcnrhCsJ8OTIZ0FylTb4HimsC2LDzcDNEpNwKTLf2SB9sc99G
 PUiVbfM2sBCQR/ACrKg4FkdHG1gvnI4ZWOXhSUrDvSfzVw7XMiNW85T6ui4JekUO9/0vfwIcY
 c7Jgv/52YdsBpTDGriIE4NkqakAaA5IfgKEKZo3Qb7JzDTnUK+upQyZ5p6KIb9kSBfy45rLpZ
 htSfJSmYQavuVBpOxKks19d37Hgnw+qVvVuHRqO3pohvRZsIGiZAjYAEKyAN7oo3TuqWAisJT
 JRb11+qDTzO8Ih2L1c8uLKWKYdZ3HUu3xpasT6oqwy4B6aGAABlK0GDMqhy8lZJDEta2LWdCN
 2Z1zP+LCtzEIf7wx0qf8vFkqqykVF6BDDrZQ358kTGkYxWMD6qxzv1zMXN03ts0DQUIdhs3iv
 fl3dmCxO07T3xKQicoOqMa3WtBc5Fdw2kFNSecosb+YsQc8IWTL0pzRPr4FXAN3iw1c8=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/02/2022 à 10:06, Thomas Huth a écrit :
> For the users, it looks a little bit weird that capstone and slirp are
> not disabled automatically if they run the configure script with the
> "--without-default-features" option, so let's do that now.
> Note: fdt is *not* changed accordingly since this affects the targets
> that we can build, so disabling fdt automatically here might have
> unexpected side-effects for the users.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   I thought I sent out that patch a couple of weeks ago already, but
>   I cannot find it in the archives, so I likely missed to send it
>   correctly. Anyway, sorry if you've got this twice!
> 
>   configure | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 3a29eff5cc..36d10d95bb 100755
> --- a/configure
> +++ b/configure
> @@ -361,9 +361,14 @@ slirp_smbd="$default_feature"
>   # are included in the automatically generated help message)
>   
>   # 1. Track which submodules are needed
> -capstone="auto"
> +if test "$default_feature" = no ; then
> +  capstone="disabled"
> +  slirp="disabled"
> +else
> +  capstone="auto"
> +  slirp="auto"
> +fi
>   fdt="auto"
> -slirp="auto"
>   
>   # 2. Support --with/--without option
>   default_devices="true"

Applied to my trivial-patches branch.

Thanks,
Laurent



