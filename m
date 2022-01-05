Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C5D4850B0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:07:11 +0100 (CET)
Received: from localhost ([::1]:57362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53CI-0002LE-PR
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:07:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n537m-0006wS-Rk
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:02:30 -0500
Received: from [2a00:1450:4864:20::42d] (port=39782
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n537l-0005QA-Az
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:02:30 -0500
Received: by mail-wr1-x42d.google.com with SMTP id s1so81859348wra.6
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 02:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T77hbC1DTy9RDPzCqdmITTYb+tnfZto6XobmVmezfaY=;
 b=dxSK9sywvZJGB6YV+LBms6SfpvJe+EiJ33JinBMnGuWQN8rQqx1lD+jH3QsONFXkQ9
 5TDji7lTegDV/2ClCBJJOnFfe0MqXaeDgh+Ikwq27cQN/7FZ/WFOZ2eCCUTaWrmBC6u5
 4w7GEoVjoa7Z8qC1ivnmfMETyD7ZegXXwxoYuQOYKfoLeIQk5UNZikganKkpG85Wjcn3
 IARlLoPA+1J+V1sCpU+bDXgaqiINklVpE9/9wGiVVVm58kEj9AoikreOlhKBOyJTBLCj
 UKbaDURobOkc+tfuYz7MyO3D+TKBbzX1BJGRfr2TB74LneBf4DsGM/xTRZJA+OrUXFWC
 s0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T77hbC1DTy9RDPzCqdmITTYb+tnfZto6XobmVmezfaY=;
 b=2i3x917Iv4G2/t8nyt0ecMCdmLTvzM2DtVxrFeG1u/Du3htWWI4XMqIIIlBR+FsfjH
 DY3M+JZObLockcUK58y3evS1wt5tIlgmqjijiIJLPnkfWNXTZFNYbrJcdnTFpInxfoG3
 DTuIaoNiei6xtNez39iGEi7l1Vn1JnMkJZ9NoZuVJltLKNS/qCvrc0uC8hixzc6vv8BG
 1/sjiKHmY6DwKtsKy4qV0/jOU+BdhFZ1EUPIGiqfXrLAfNCa0PTfxJgfoVJlUgTgEnVM
 LzKz8+7Eh2QahgX+HHhflGxnBksRvueMwiThbiy7Naasd+L5tObyPcp80NbmXXCYu37g
 kbgA==
X-Gm-Message-State: AOAM533pOSe+Hq6PvAXUhjy7sgH8xNVAGYhhI2L3ZrGtKpve+SEkfYo7
 juD5suxPH3PQxTjJ21SmPU4=
X-Google-Smtp-Source: ABdhPJzGaIilKd7wfNMvEObsYFVorwA46dWrAdFA73nvPsD99Un6L0H+E04lnPc8ywcYRIw3GNc2OQ==
X-Received: by 2002:a5d:4e0f:: with SMTP id p15mr45585524wrt.344.1641376946937; 
 Wed, 05 Jan 2022 02:02:26 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id b7sm738003wro.68.2022.01.05.02.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 02:02:26 -0800 (PST)
Message-ID: <946bb6b6-34e3-bacd-c0ef-829252c8ddce@amsat.org>
Date: Wed, 5 Jan 2022 11:02:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] FreeBSD: Upgrade to 12.3 release
Content-Language: en-US
To: Brad Smith <brad@comstyle.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alex Benn_e <alex.bennee@linaro.org>
References: <YdUCQLVe5JSWZByQ@humpty.home.comstyle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <YdUCQLVe5JSWZByQ@humpty.home.comstyle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/5/22 03:28, Brad Smith wrote:
> FreeBSD: Upgrade to 12.3 release
> 
> Note, since libtasn1 was fixed in 12.3 [*], this commit re-enables GnuTLS.
> 
> [*] https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
> 
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>
> Tested-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Warner Losh <imp@bsdimp.com>
> ---
>  .gitlab-ci.d/cirrus.yml | 5 +----
>  tests/vm/freebsd        | 8 +++-----
>  2 files changed, 4 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

