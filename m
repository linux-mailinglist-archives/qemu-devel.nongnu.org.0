Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C290B589B32
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 13:49:07 +0200 (CEST)
Received: from localhost ([::1]:53454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJZLe-0001du-Tj
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 07:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJZHN-00062P-Ea; Thu, 04 Aug 2022 07:44:41 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:38909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oJZHL-0002dR-Ib; Thu, 04 Aug 2022 07:44:41 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mt7Pt-1nQEhf42WX-00tVvv; Thu, 04 Aug 2022 13:44:35 +0200
Message-ID: <0d2ae99c-5004-acf4-197e-4cb9526e317f@vivier.eu>
Date: Thu, 4 Aug 2022 13:44:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] README.rst: fix link formatting
Content-Language: fr
To: Cornelia Huck <cohuck@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
References: <20220803090250.136556-1-cohuck@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220803090250.136556-1-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:e0ZQg5iAZz6msPYz82wxcJTV3/0qCzJvVz5VLahMSdIfi8EZlLe
 wXa0UTUREvZe/1BiaWlNiDSnWKQI/eYsawIjtVrxI4dLnNW74QrMymukQ/ph8ca/9gnbtsA
 NjabVNctGDtETS0VnRRN+oOKXpkDMrRaZOQ4v7EIVxGzFlz2vfOhd8oFTgEiSzi1L38fgHO
 QO2fXHvRdwyuxzam23VQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mJZ8ZUrLYvk=:83R4lJX+/fOT7XzPD+6mtx
 7NkOPyGGh5x/PopRaCw9nm6/p3MV3TYEy7bTLJK77olpvYYXXIBsNNtULCIkVJcLgZSX0fdDw
 HP1akzq3gnKAiBh7TXUAVacL2wxJ5tl+CuvOK/cDkFZjLwBuaJ5xZ8WhSYqPH2Vvw9/XF6qDH
 YQGxVATTbLuw+FlVLFhbXxmmfxyoqsLsTg7zurfNNpQQSKtuvqbk0lxR/kDDOLt3x5sZ6A4mr
 mHIUrBfZVAXBsj6xH05jbq622FiQ+D/r2xU/2gtl26eKKdTeSlW1qVGjBOzk6HVNFbUgBoyvP
 rmovaAyKIrl1ZXJmsmsi60hLfJjyW5XnfNblHq+EN8K/ymgetiE5TQ5BocuHv9qwr3l0rQ0k6
 A2bGJkjxUc4GOse1p+T8L0N3Ayms2X/v6jm8TeVXUAxXbti8k1jXqw9XF0W7IZBkNkLTGJLwT
 74YbXC90CSF/PR7HG3KPcn3MCTz4Z03Gf+WR4glbCM6QEwJXXGxki+4+ADA4/lphszb9mYjfP
 m2YVXQoNGSLx1H512vJWRs5zPma3qpi02vyDQHoXHWaj9ZUhjhAZpADYxZiytwvQPgZPzF5q3
 kkNdeJb+ZGcNQ/ICeEu+E20OVYme+oSStUxlH3c6ae7LrRpNgkdmihFdyT7/lGk8iQemRJvTv
 +9giuIv6/xjSZCIROfDCJn9rW8dyxxQiKGWg+Xph7Dv/x5dwRqOyogomIb6kyK6Hs0bCZ+16j
 O9GFx+auclykTYrbYT5ipv8QcyTDVbum4qtqQg==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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

Le 03/08/2022 à 11:02, Cornelia Huck a écrit :
> Make the links render correctly.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   README.rst | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/README.rst b/README.rst
> index 23795b837740..21df79ef4379 100644
> --- a/README.rst
> +++ b/README.rst
> @@ -39,7 +39,7 @@ Documentation can be found hosted online at
>   current development version that is available at
>   `<https://www.qemu.org/docs/master/>`_ is generated from the ``docs/``
>   folder in the source tree, and is built by `Sphinx
> -<https://www.sphinx-doc.org/en/master/>_`.
> +<https://www.sphinx-doc.org/en/master/>`_.
>   
>   
>   Building
> @@ -78,7 +78,7 @@ format-patch' and/or 'git send-email' to format & send the mail to the
>   qemu-devel@nongnu.org mailing list. All patches submitted must contain
>   a 'Signed-off-by' line from the author. Patches should follow the
>   guidelines set out in the `style section
> -<https://www.qemu.org/docs/master/devel/style.html>` of
> +<https://www.qemu.org/docs/master/devel/style.html>`_ of
>   the Developers Guide.
>   
>   Additional information on submitting patches can be found online via

Applied to my trivial-patches branch.

Thanks,
Laurent

