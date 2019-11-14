Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A32FC1FB
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 09:57:09 +0100 (CET)
Received: from localhost ([::1]:54508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVAw8-00066c-Sn
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 03:57:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54042)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iVAvK-0005dt-1M
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 03:56:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iVAvJ-0001hg-1Q
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 03:56:17 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35310)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1iVAvI-0001gl-Ol
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 03:56:16 -0500
Received: by mail-wm1-x342.google.com with SMTP id 8so4950442wmo.0
 for <qemu-devel@nongnu.org>; Thu, 14 Nov 2019 00:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KWSpBLElO2uJ1wnYdyUBzLYbWWlGVYGedTPYCouYEU0=;
 b=cVtpi/8qiaL2oXX36B+srotDnIA1vmNwTITpHzCo3eew2quFlp7Yg9VO94d5sNcqUc
 xQ0E+t1cWaN8yO9oq7Cn9qAxPqbObfk9sT19CpnPwqxnNIhVENI1iSFzjGfDUgrRAHQy
 6jCR7PO/+kQRPPgtbkqEaWLqHHjR5uQr9bF9G7tvT8wHXKBopegkEZEK8Sk6TFsAGRiB
 KyJROpP/U1WWAt5k9c8bWRtHtQj+RtNgmrupnBl1bSYQ1jFF/g0nfzQKS73oIDeSLhHw
 7dcMYlRnrqeHoMzNEiQVBxMkBZZo8Y+Yt6lJfyd02KaqRiq61zA5mVcGEV3rNkltKNgx
 83Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KWSpBLElO2uJ1wnYdyUBzLYbWWlGVYGedTPYCouYEU0=;
 b=tsqKHIEX1wiuGX7k3CENqmsb97wsQlJ2JnPDRafDkjLwyyxa4FBKzXAFcA3SpyKeyh
 sx3E/HTJjFM/41dw+zLjI7HNiGXuBkq5tVhU7hXJtNOtD17gPY0x1LiKhvHRA0LQ5e7n
 betbPUjOcOnFsL0v8Xpe63mGYzkQSIbSND+9gLP8vshlzEQS3FyKzqITqySXSskooJ5t
 O7ogsufOPqnhe6IYtfvqJC3mgO+i9r5QCq3VQe4WG8U40a5rT89XBUWIiPDFjlGP95k+
 dcKbQB9YF0yt18BT7ZOQTBC7xKiSGNVbtw62gWJ4sYf1MTtlKotT3f5YNzT0/V+8mb9/
 3mlQ==
X-Gm-Message-State: APjAAAUiK5gsUPL4OWGHhBdumQlqKYVbGSgopNDiwdc8yt93xuYqypW+
 Nt5jvzOEm72fq+nEkVcVBBhUPfVKV251Zr4nVVo=
X-Google-Smtp-Source: APXvYqywhMqP4jJmyL54hQtr5VKdEa0xsCJnu8s0wg+9nyEyonYbBOFOKBrEsXDqgZwxffO0GilsGW7cWSQAigRL2X0=
X-Received: by 2002:a1c:a986:: with SMTP id s128mr6541538wme.20.1573721775469; 
 Thu, 14 Nov 2019 00:56:15 -0800 (PST)
MIME-Version: 1.0
References: <1573655945-14912-1-git-send-email-pbonzini@redhat.com>
 <1573655945-14912-2-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1573655945-14912-2-git-send-email-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 14 Nov 2019 12:56:03 +0400
Message-ID: <CAJ+F1CKaxddkwtE6GGQMxhrUxbFaw8EaokU=Q4VLQH6Y66DqVw@mail.gmail.com>
Subject: Re: [PATCH 01/16] memory: do not look at current_machine->accel
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Nov 13, 2019 at 6:39 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> "info mtree" prints the wrong accelerator name if used with for example
> "-machine accel=3Dkvm:tcg".  The right thing to do is to fetch the name
> from the AccelClass, which will also work nicely once
> current_machine->accel stops existing.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  memory.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/memory.c b/memory.c
> index c952eab..1764af8 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -2986,7 +2986,6 @@ struct FlatViewInfo {
>      bool dispatch_tree;
>      bool owner;
>      AccelClass *ac;
> -    const char *ac_name;
>  };
>
>  static void mtree_print_flatview(gpointer key, gpointer value,
> @@ -3056,7 +3055,7 @@ static void mtree_print_flatview(gpointer key, gpoi=
nter value,
>                  if (fvi->ac->has_memory(current_machine, as,
>                                          int128_get64(range->addr.start),
>                                          MR_SIZE(range->addr.size) + 1)) =
{
> -                    qemu_printf(" %s", fvi->ac_name);
> +                    qemu_printf(" %s", fvi->ac->name);

There was a discussion on the original patch that this will have
-accel appended.

I don't think that's a big issue, someone can submit another patch
later if it's important.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

>                  }
>              }
>          }
> @@ -3104,8 +3103,6 @@ void mtree_info(bool flatview, bool dispatch_tree, =
bool owner)
>
>          if (ac->has_memory) {
>              fvi.ac =3D ac;
> -            fvi.ac_name =3D current_machine->accel ? current_machine->ac=
cel :
> -                object_class_get_name(OBJECT_CLASS(ac));
>          }
>
>          /* Gather all FVs in one table */
> --
> 1.8.3.1
>
>
>


--=20
Marc-Andr=C3=A9 Lureau

