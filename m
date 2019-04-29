Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22765E462
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 16:12:40 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58181 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL71L-0006BO-B7
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 10:12:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL6zu-0005bX-6c
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:11:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL6zt-0007k8-7t
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:11:10 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:40751)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL6zt-0007iO-3V
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:11:09 -0400
Received: by mail-oi1-x244.google.com with SMTP id y64so2843208oia.7
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 07:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+AilI5zETVzPZ/xTCznOvyvudXyWZxISGww0p6O2+xA=;
	b=L63EE6/NU33bOc3uRWG27S8iPC8qMQI5xroJ2D6gCV4k8wV6NJLjwVzWdT3GpKrNc9
	uXD3KTCK089J3VJgF9j6x/I6tM7iwXuYVhGjnwOxUJM4TP3Z2QZSuKSWw2it1WrkuUcP
	OKy6A7Zbjx+HkCgIV7HzmTziLDVD2rZ7FpiUKh4IaifNLdiB769Y/+w08qbyaTQMzYd7
	Af8OHobiHfDrSlAhwau0F8FrxgTIsLd38y5GByzTgXqBuc1aLD5Tps6tKejWyqy9uHV9
	geniNJF5XJ0zzQ/GX64XtsYfLys3KkJ2PwQX27ayQv3/FQwzW16/qGVauvV4AYyqhiSz
	R5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+AilI5zETVzPZ/xTCznOvyvudXyWZxISGww0p6O2+xA=;
	b=aFV8+Jn6frtZTktFZFIKk9KAXz6yAmchixQ+ljQ1cpKN87ZYJIkNTtCAf4QmUAIlcD
	W4Wpiew4AZis8kY3COjK9SSTN9TKJMcODp03MYMcDVn6mO5oHG9Q8ereKPotNG2+whmc
	Yg6Qc2LBOCrBVO0q2YrlaI41zsa4awvL0BxTwDWphbf1Q/8Wb/CXLclK7E1D2t63w9Gf
	gjUdUAKzzuF9S8YNGdgIDvCewM6r/bzgSmmJdVeM/WnBHJqhCM8EuUOAL4QbWcDafB9q
	df/1pIK6cl5uPCStBrQiS1CC6b9KJITxgXrkKnojh0d76xnmx5GB+qTU4r9grB+yE1aC
	8QVQ==
X-Gm-Message-State: APjAAAWfoNy7KnKDtlYoCeFzSuGTClO0lj7SfJqzJ+JFP6LrXo8vqe6M
	enQEu9EMmv5kvJV+e4I1wVtvcBunljM2r8K5VQhuiRXpcw0=
X-Google-Smtp-Source: APXvYqxxWODYMX55pC1LYFSoClSxtbYZbS9b2dHB00GNJ8oqpk/vRtbJirXWPbmdz1U+PDYYW2I1Igrk1h9EaMwXjKo=
X-Received: by 2002:aca:b3c2:: with SMTP id c185mr16889662oif.98.1556547067235;
	Mon, 29 Apr 2019 07:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190328230404.12909-1-richard.henderson@linaro.org>
	<20190328230404.12909-12-richard.henderson@linaro.org>
In-Reply-To: <20190328230404.12909-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 15:10:56 +0100
Message-ID: <CAFEAcA9x-34eEU4B4utse+9DDhZkCmv3Q0yqR-b55R2DBMf8ng@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH for-4.1 v2 11/36] target/hppa: Use env_cpu,
 env_archcpu
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Mar 2019 at 23:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Combined uses of CPU(hppa_env_get_cpu()) were failures to use
> the more proper, ENV_GET_CPU macro, now replaced by env_cpu.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hppa/cpu.h          |  5 -----
>  linux-user/hppa/cpu_loop.c |  2 +-
>  target/hppa/helper.c       |  3 +--
>  target/hppa/int_helper.c   |  4 ++--
>  target/hppa/mem_helper.c   | 10 ++++------
>  target/hppa/op_helper.c    |  8 +++-----
>  6 files changed, 11 insertions(+), 21 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

