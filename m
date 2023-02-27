Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651136A40A1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:28:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbg3-0004R9-U6; Mon, 27 Feb 2023 06:28:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pWbfs-0004Ne-Ov
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:28:10 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pWbfr-0003wA-3i
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:28:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=L6+vZfBfFK7CRn1Fd6KAzHe4dfBpFTsH+K38C6lIq8M=; b=a8gkR2hR9TYOgK6VztRu1j+OtO
 gtlM9iO82mQpkvUJFtuSUVTpXcI6R+qo63LQUzlYXHQzPub8IhWqiVFyAWkUF8DgNLr69EXOr8v3w
 Cppu6NpKKsRc8jAro3466HJfezSCI38omXo2r3SLBpqnR3UDFdtbqVjnBlc6T4q5xCvcctapusyk1
 FDFPOAB5y6gNRuxG7R6c25WQv9y/QrV8XUbc/70rFM+jgAv48GTzbc/mLNm/CC55UiBfK/sGYgHsi
 UpiTOU2BOUPNqBG8/cxDlFmasLFhjibRfPH4M/OURARSQMHgg9KZK9uTc/DLPpkBrJFgqXP1DRhBL
 AbchiaPFaZl7r1a+XYLnPH4aZa4cj9D7rHPFe7dqHhJk3DvN4QxbV8NPplnMeC5hqtyzcM3F/QAS3
 Sx4bn0eOBH8wbRKOxJnohzfFKhud77bZSrK5PMDYMBktliYnw0yxSL7DbJngL/p0K0/PiXpNz5QFR
 ySgMEol5yXSaGqckc23YfDkSyqEd2cA73q+wgIiNYGMAZWoJw1w47+7hxnPolZ3k9kmlCTEIfF2TF
 bjZTOSksae5CAdrxvjdA95mkKdjjMzVO8fugXbOAv8xGb7QkKFeryO0S+7ShV/Tn4qhoGWhdNDXcC
 z7N04YPiFgwT8MCgWWLxHtkMaTin5jh7E0vDHsxq4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] ui/cocoa: user friendly characters for release mouse
Date: Mon, 27 Feb 2023 12:28:02 +0100
Message-ID: <3215072.rVCME8qtki@silver>
In-Reply-To: <E1pAClj-0003Jo-OB@lizzy.crudebyte.com>
References: <E1pAClj-0003Jo-OB@lizzy.crudebyte.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tuesday, December 27, 2022 5:15:31 PM CET Christian Schoenebeck wrote:
> While mouse is grabbed, window title contains a hint for the user what
> keyboard keys to press to release the mouse. Make that hint text a bit
> more user friendly for a Mac user:
> 
>  - Replace "Ctrl" and "Alt" by appropriate symbols for those keyboard
>    keys typically displayed for them on a Mac (encode those symbols by
>    using UTF-8 characters).
> 
>  - Drop " + " in between the keys, as that's not common on macOS for
>    documenting keyboard shortcuts.
> 
>  - Convert lower case "g" to upper case "G", as that's common on macOS.
> 
>  - Add one additional space at start and end of key stroke set, to
>    visually separate the key strokes from the rest of the text.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

Ping

>  ui/cocoa.m | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index e915c344a8..289a2b193e 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -72,6 +72,9 @@
>  
>  #define cgrect(nsrect) (*(CGRect *)&(nsrect))
>  
> +#define UC_CTRL_KEY "\xe2\x8c\x83"
> +#define UC_ALT_KEY "\xe2\x8c\xa5"
> +
>  typedef struct {
>      int width;
>      int height;
> @@ -1135,9 +1138,9 @@ - (void) grabMouse
>  
>      if (!isFullscreen) {
>          if (qemu_name)
> -            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s - (Press ctrl + alt + g to release Mouse)", qemu_name]];
> +            [normalWindow setTitle:[NSString stringWithFormat:@"QEMU %s - (Press  " UC_CTRL_KEY " " UC_ALT_KEY " G  to release Mouse)", qemu_name]];
>          else
> -            [normalWindow setTitle:@"QEMU - (Press ctrl + alt + g to release Mouse)"];
> +            [normalWindow setTitle:@"QEMU - (Press  " UC_CTRL_KEY " " UC_ALT_KEY " G  to release Mouse)"];
>      }
>      [self hideCursor];
>      CGAssociateMouseAndMouseCursorPosition(isAbsoluteEnabled);
> 



