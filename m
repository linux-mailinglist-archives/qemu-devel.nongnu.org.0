Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F319628BA85
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 16:14:25 +0200 (CEST)
Received: from localhost ([::1]:51668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRyam-0001GP-Gc
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 10:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kRyZD-0000SX-39; Mon, 12 Oct 2020 10:12:47 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:52621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kRyZA-0004Hk-Gq; Mon, 12 Oct 2020 10:12:46 -0400
Received: from [192.168.100.1] ([82.252.141.186]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N1wdj-1kLhCG1ujh-012EJx; Mon, 12 Oct 2020 16:12:37 +0200
Subject: Re: [PATCH] tests/test-char: Use a proper fallthrough comment
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201002171343.283426-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <88c25a6d-49fd-efc1-b335-012d4b4ec9ca@vivier.eu>
Date: Mon, 12 Oct 2020 16:12:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201002171343.283426-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:KJQnHIPqTrKh9jW4fltsOsyhxtqmC4sYRwLF1mLaJvDtGALT7iD
 huGkiw5Czj1hgjjY6VmwNUxbQdJTHq4cvl05qFexFEzOAC5JNdFpvsnSPLzwj4Whkg0bjxc
 MJYJsqmYmZIlq9e2V3r4uA/o0pU0fnl93nEj+3mQxBKuXRrXS7eh7xzIedybhRlgjcFgZTl
 bm1GjAnC4KUFnvetzIXNg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NUFcNsF+IbA=:18KBogUyN0oB/PYloDpcjM
 qeLq+qRD9hW8tbdq4e3A/eFTaaSre/0PXIl+0YGEIRsWqFUBXZ2v+/OsYkk9y3CV5SD0m6HFT
 tgh/yL09zoTCzPGkvzUloTRZJHVyaO8CfkQA+3ijOFtH51ldYILwjQGaiGXhhYn8rEtZRMNo+
 OafWDBvJMqozMdi+oABshYsFiRcEdBsKIYOPTV1WSjWBo6+BfsWr7I9qSwv/juJ79u30tfw/3
 Rmp2F/+4zQ5rh23iWtsCjLLgZp053RCCuYhWvJJnYo1KTBXe8+2LupdOZDB1dTf9kamDPZA0j
 b/d4fy8CKYLa0RI566v2zqI8IrbMha/o/EfaAcpFRSrHmmHXZjG5R/hJyR6/hoybnmRM3+znU
 imS1T/C0DLdvUrbwFbBD2ByQ/OSM8oGEpTWulNyLEcYXvhCHuAWK25WobhHD7eNNENHzmuyJL
 MnZgaH9KwiuK3iHN6Pb1AuUbvg63H/GoSwtn7GEzmX0HXWlMVK2L4a5YdqAq/E5RoYI3ZqP4E
 fwuRC6IMmtxlWh3yhDHsOSHcaGBy9Yr2c7zmOXl6TBxjCmp1060q7/UA/IGjPS39QF66bpDmj
 k2QwXttmr8vfM5ItqThfisVF/OlLxyvcNkh0cScSNP2aEQrQk7alYVxtd6jNYYr2UakcHrhtY
 743W1h4kGfT3TCRShl3qwF1Dvx0c/W+1m21cXwkDVihSt2sQ6zoTTad1fd6m5V8kJddlIgtG7
 qDYV+usVCXbVvgR+vyO23+17mxl7JRDwv1YXj3I6LoQKbhHo9r5sxDARY8cE8NF/p6O7I74gH
 Q/cZREHLxjxHnbX3Ot2btY+su82/xdv03yoDzjBOSWeKjdzoauQBUOmDfcRO2GS6O3DM3d2
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 10:12:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/10/2020 à 19:13, Thomas Huth a écrit :
> For being able to compile with -Werror=implicit-fallthrough we need
> to use comments that the compiler recognizes. Use "fallthrough" instead
> of "no break" here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/test-char.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/test-char.c b/tests/test-char.c
> index d35cc839bc..9196e566e9 100644
> --- a/tests/test-char.c
> +++ b/tests/test-char.c
> @@ -70,7 +70,7 @@ static void fe_event(void *opaque, QEMUChrEvent event)
>              h->openclose_mismatch = true;
>          }
>          h->is_open = new_open_state;
> -        /* no break */
> +        /* fallthrough */
>      default:
>          quit = true;
>          break;
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


