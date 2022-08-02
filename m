Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A53587BAC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 13:36:49 +0200 (CEST)
Received: from localhost ([::1]:38954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIqCe-0006J1-8m
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 07:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oIqAh-0004qZ-Se; Tue, 02 Aug 2022 07:34:47 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:50005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oIqAg-0004JO-3R; Tue, 02 Aug 2022 07:34:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=2jutLbbDTOLcA0VBGC/s3qrdQohT1L0p+rr5yokHnOI=; b=u9U7m8+2SMd9lHxIItXlrp57nZ
 vGyLKJVOWqPBTUE12aKMXcVjPWLMBCG+RM+liqkJfOhq/KRFL97imVpKxT3C1nM1QjLfwpnanjKOf
 ya/djAwrS5YY6SoEORYO7jnXsTkmQyG177gWcoQC//cYZ6sAar9eNu0RPGIkqdZA4e2aWd4b5ULiU
 r5LOzFVXaKOpESsAG+A31May8gavphFa5zxqssxsBDqXA4cvnWROA9y12vKF4zyWMUF5E4z/uHQMW
 oERLRYNoUqsKxMosDLtIQZj1qbluOvKtxvfMIra0XTYi3uVFVspSGdJ6McTu524HSjACnF5EUBBN4
 PfxoBttVgKWkRx4Rv0i4ebQO6NgNuoKxeNB4NJlbRi9adM0PjkRhQgfbz72HvxDBI3aLMKd6RgKTf
 qFwxEHWtAmyVcOAdqHhwpgoJogXul/qkL04NKPhM9ZoJvhSUCpYd1AUEVPX4fzYSuPAQnWaJZS9JV
 +3IpCejM/GIA5hNHVLBGXL6oMPhRl5HTzVkeErVbucFSew4N80ZG21XavRkHbxUzJrDN0SiCZL+46
 WxLo5pUDWCwXHhBBBbM6v3NFRpZywVrV3OoFC54tUc5FtV3IWhpkCyPVjC+79gZeNGKJY3/iFmcbi
 X6lERlJcNb/xu++SH4YseuE+PZ2fuma/DWBMjsZOo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Paolo Bonzini <pbonzini@redhat.com>, kraxel@redhat.com,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] docs/about/removed-features: Move the -soundhw into the
 right section
Date: Tue, 02 Aug 2022 13:34:38 +0200
Message-ID: <1719315.SO3xn117Sn@silver>
In-Reply-To: <20220802075611.346835-1-thuth@redhat.com>
References: <20220802075611.346835-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Dienstag, 2. August 2022 09:56:11 CEST Thomas Huth wrote:
> The note about the removal of '-soundhw' has been accidentally added
> to the section of removed "linux-user mode CPUs" ... it should reside
> in the section about removed "System emulator command line arguments"
> instead.
> 
> Fixes: 039a68373c ("introduce -audio as a replacement for -soundhw")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

That can easily happen unfortunately, as the hierarchy syntax here, like in 
MAINTAINERS BTW, is not exactly perfect for the human eye.

>  docs/about/removed-features.rst | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/docs/about/removed-features.rst
> b/docs/about/removed-features.rst index c7b9dadd5d..925e22016f 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -396,6 +396,13 @@ Use ``-display sdl`` instead.
> 
>  Use ``-display curses`` instead.
> 
> +Creating sound card devices using ``-soundhw`` (removed in 7.1)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Sound card devices should be created using ``-device`` or ``-audio``.
> +The exception is ``pcspk`` which can be activated using ``-machine
> +pcspk-audiodev=<name>``.
> +
> 
>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------
> @@ -681,13 +688,6 @@ tripped up the CI testing and was suspected to be quite
> broken. For that reason the maintainers strongly suspected no one actually
> used it.
> 
> 
> -Creating sound card devices using ``-soundhw`` (removed in 7.1)
> -'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> -
> -Sound card devices should be created using ``-device`` or ``-audio``.
> -The exception is ``pcspk`` which can be activated using ``-machine
> -pcspk-audiodev=<name>``.
> -
>  TCG introspection features
>  --------------------------



