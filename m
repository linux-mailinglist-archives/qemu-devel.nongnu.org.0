Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D68812BB123
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:06:19 +0100 (CET)
Received: from localhost ([::1]:33378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9rW-0005Me-Ol
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:06:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kg9gv-0007Eo-9W
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:55:21 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:45393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kg9gs-0003tV-FW
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:55:20 -0500
Received: by mail-io1-f65.google.com with SMTP id u21so10576127iol.12
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 08:55:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pQA0g5y85GNRHq7pQZ8AdL0qQZnL4E72HFfz5p2YuC0=;
 b=DPLUuNu8ENBeigciFaNrAjXRUd4BDfH+PQvST8HoLdgiDCen4fgTl5hWz9SWEuWROL
 V0g3wfaIJXE7zg6xX8Oixg62QKB9tocvW5H820b494yfb8lad2PHz5vkifbpfhZx9QS3
 iSNo9d2N4EslGrvEqlfTG+NPOzDubW1/3qCOSUhEr2jTk6ADQLuD7yk0RNlvikUZkmpw
 nc0E0lPlgR69L+VY9cMj3peqiHn0xvpSwWDbYAfVZSU2y71O4+GvzsFAD6g/gAyuB8sc
 Tb2byD9dsHNhbHBLFCAS4sR0x4a9A225lOcafLWPLG2uHDyg13dQu2ftcDWsHOjx5Lgq
 4HhQ==
X-Gm-Message-State: AOAM531IktRmh6WU4BqaIZErs0h9qpRw+e2IheWe99325wJIZ+tBDidW
 Pa0UWAcrXupskhTm5cwfJkA45fl5Rw8=
X-Google-Smtp-Source: ABdhPJwelxmlCYW8DIMAmTnKZ89rA4KBVwnIBaa2Fijp2h9T4U6RibDKOr6DvAWutipQjoSqUOzoXQ==
X-Received: by 2002:a05:6602:314c:: with SMTP id
 m12mr8409596ioy.100.1605891317299; 
 Fri, 20 Nov 2020 08:55:17 -0800 (PST)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181])
 by smtp.gmail.com with ESMTPSA id b9sm2154554ila.51.2020.11.20.08.55.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 08:55:17 -0800 (PST)
Received: by mail-il1-f181.google.com with SMTP id l12so9154081ilo.1
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 08:55:17 -0800 (PST)
X-Received: by 2002:a92:ddc2:: with SMTP id d2mr23354617ilr.33.1605891316774; 
 Fri, 20 Nov 2020 08:55:16 -0800 (PST)
MIME-Version: 1.0
References: <20201108232425.1705-1-j@getutm.app>
 <20201108232425.1705-8-j@getutm.app>
 <abb6c2d9-d375-1963-e0a0-627636643860@amsat.org>
 <CA+E+eSC0hj=hOhpLForn9KQw39-ZcOMRRG-D__iYDneqDOcZ3g@mail.gmail.com>
 <1a1dab52-fb82-64e7-0067-7957aae37281@amsat.org>
In-Reply-To: <1a1dab52-fb82-64e7-0067-7957aae37281@amsat.org>
From: Joelle van Dyne <j@getutm.app>
Date: Fri, 20 Nov 2020 10:55:06 -0600
X-Gmail-Original-Message-ID: <CA+E+eSDKwusE9_h8N5vd+zod6MsE8ki1hwT7h6shd2=kB=tpFg@mail.gmail.com>
Message-ID: <CA+E+eSDKwusE9_h8N5vd+zod6MsE8ki1hwT7h6shd2=kB=tpFg@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] block: check availablity for preadv/pwritev on mac
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.65; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f65.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

How about this:

static bool preadv_present =3D true;
static bool preadv_checked =3D false;

static ssize_t
qemu_preadv(int fd, const struct iovec *iov, int nr_iov, off_t offset)
{
#ifdef CONFIG_DARWIN
    if (!preadv_checked) {
        if (__builtin_available(macOS 11, iOS 14, watchOS 7, tvOS 14, *)) {
            preadv_checked =3D true;
        } else {
            preadv_present =3D false;
            return -ENOSYS;
        }
    }
#endif
    return preadv(fd, iov, nr_iov, offset);
}

-j

On Fri, Nov 20, 2020 at 10:21 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> On 11/20/20 4:49 PM, Joelle van Dyne wrote:
> > No, because if you build on a macOS 11 host but try to run it on macOS
> > 10.15 then it will crash.
>
> I'm not asking to move the check to configure/build time,
> but to do it only once at runtime...
>
> >
> > -j
> >
> > On Fri, Nov 20, 2020 at 4:32 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> >>
> >> On 11/9/20 12:24 AM, Joelle van Dyne wrote:
> >>> macOS 11/iOS 14 added preadv/pwritev APIs. Due to weak linking, confi=
gure
> >>> will succeed with CONFIG_PREADV even when targeting a lower OS versio=
n. We
> >>> therefore need to check at run time if we can actually use these APIs=
.
> >>>
> >>> Signed-off-by: Joelle van Dyne <j@getutm.app>
> >>> ---
> >>>  block/file-posix.c | 12 ++++++++++++
> >>>  1 file changed, 12 insertions(+)
> >>>
> >>> diff --git a/block/file-posix.c b/block/file-posix.c
> >>> index d83219df55..a9d69746a0 100644
> >>> --- a/block/file-posix.c
> >>> +++ b/block/file-posix.c
> >>> @@ -1394,12 +1394,24 @@ static bool preadv_present =3D true;
> >>>  static ssize_t
> >>>  qemu_preadv(int fd, const struct iovec *iov, int nr_iov, off_t offse=
t)
> >>>  {
> >>> +#ifdef CONFIG_DARWIN /* preadv introduced in macOS 11 */
> >>> +    if (!__builtin_available(macOS 11, iOS 14, watchOS 7, tvOS 14, *=
)) {
> >>
> >> Can we change the CONFIG_PREADV ifdef'ry to run this check once
> >> on macOS 11?
> >>
> >>> +        preadv_present =3D false;
> >>> +        return -ENOSYS;
> >>> +    } else
> >>> +#endif
> >>>      return preadv(fd, iov, nr_iov, offset);
> >>>  }
> >>>
> >>>  static ssize_t
> >>>  qemu_pwritev(int fd, const struct iovec *iov, int nr_iov, off_t offs=
et)
> >>>  {
> >>> +#ifdef CONFIG_DARWIN /* pwritev introduced in macOS 11 */
> >>> +    if (!__builtin_available(macOS 11, iOS 14, watchOS 7, tvOS 14, *=
)) {
> >>> +        preadv_present =3D false;
> >>> +        return -ENOSYS;
> >>> +    } else
> >>> +#endif
> >>>      return pwritev(fd, iov, nr_iov, offset);
> >>>  }
> >>>
> >>>
> >>
> >

