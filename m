Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C98549FEB0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 18:09:57 +0100 (CET)
Received: from localhost ([::1]:60038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUl0-0002Z6-RP
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 12:09:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nDTT8-0000hU-TK
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:47:22 -0500
Received: from [2607:f8b0:4864:20::634] (port=45648
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nDTT7-0000XI-70
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:47:22 -0500
Received: by mail-pl1-x634.google.com with SMTP id s6so743632plg.12
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=/5GaBjAPDkft9rss8AjJbYiyeSgUzkGFpx6lcIFGalg=;
 b=CUgy2U8mNb65Wm9Bm4YduWGDpEY+TZoG9/0sL4d/O604sGT4RL3O6TIjRru2FGXGs2
 9Il9/O2yLeq3NB1QvqvZEP8Ptil3dVLRJt8GAfBYVZ3y5bwRrq9jTPobsjRQTKwdpvE0
 gXS5gtjgVw/ArFMnZ+dUpyVn8WZ4bINoQN6EwUPFuLZQDsA/114R9rkn3vJSLmNp+7rc
 yGZHDCx5TM0fZ5M4pQLci+d8sE4JT43D8ITyoXCzLoYrWQRilLZSr96pfcjR/lh+aORQ
 oupgzREQrEjwpmClDeb7UlpW+0WPAGIQgzu9GwgrNYIUIbIsTt5ruOGVu3Zv1m8AsWNy
 OcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=/5GaBjAPDkft9rss8AjJbYiyeSgUzkGFpx6lcIFGalg=;
 b=XE2ZJKgWhti8BZxsV9gazFZmd8UEcfOJIW5QLNIaLkP/5N++D25SLtvnNhi1ToABsw
 SFfp0fKPjL/cLoeyzc+ldUcqK2tL37rk1jDLZXgXDnyZF/jrXQacZ74pIu9NEwl7UpZ0
 T0wPzQ4RZCk+pcQMKih+MyBeuJL383t4wJqkBgjIicXsi5bH6KjCrkr4Yd3XTq5qf2CE
 4N1K5ejXxZ5l6Laono0HQejS7JVPhBUaR5dYNsHmCBNrkjSTS+yGK9WurY1YgAXJcvMs
 KFBg0K9rro+FkID+JoeXObuGsKl3F5fgP8VubYHTd6JoWlnf+aBwvpWlYY2oE2VyKb8A
 HAbA==
X-Gm-Message-State: AOAM530xQ3vJAdDiK9ki+tnCkIxJ9nGnivevE4262wo0zfJ5GCzL6cAb
 pjpLMaCEwOMnXzDBC5eDutVGko1dkxbA2Ob6wFMtkLuliSI=
X-Google-Smtp-Source: ABdhPJz07lUVrIA488ClPtp8e7LOJ/LZf0rzcLMV7vdst+jqtEFW2z52dNVLNB298s5Bx3475Czb6PnszVa8e1+opYE=
X-Received: by 2002:a17:902:9303:: with SMTP id
 bc3mr8614449plb.145.1643384839415; 
 Fri, 28 Jan 2022 07:47:19 -0800 (PST)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 28 Jan 2022 15:47:08 +0000
Message-ID: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
Subject: Call for GSoC and Outreachy project ideas for summer 2022
To: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>, 
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=stefanha@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sergio Lopez <slp@redhat.com>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Hannes Reinecke <hare@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, "Florescu,
 Andreea" <fandree@amazon.com>, hreitz@redhat.com,
 Alex Agache <aagch@amazon.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dear QEMU, KVM, and rust-vmm communities,
QEMU will apply for Google Summer of Code 2022
(https://summerofcode.withgoogle.com/) and has been accepted into
Outreachy May-August 2022 (https://www.outreachy.org/). You can now
submit internship project ideas for QEMU, KVM, and rust-vmm!

If you have experience contributing to QEMU, KVM, or rust-vmm you can
be a mentor. It's a great way to give back and you get to work with
people who are just starting out in open source.

Please reply to this email by February 21st with your project ideas.

Good project ideas are suitable for remote work by a competent
programmer who is not yet familiar with the codebase. In
addition, they are:
- Well-defined - the scope is clear
- Self-contained - there are few dependencies
- Uncontroversial - they are acceptable to the community
- Incremental - they produce deliverables along the way

Feel free to post ideas even if you are unable to mentor the project.
It doesn't hurt to share the idea!

I will review project ideas and keep you up-to-date on QEMU's
acceptance into GSoC.

Internship program details:
- Paid, remote work open source internships
- GSoC projects are 175 or 350 hours, Outreachy projects are 30
hrs/week for 12 weeks
- Mentored by volunteers from QEMU, KVM, and rust-vmm
- Mentors typically spend at least 5 hours per week during the coding period

Changes since last year: GSoC now has 175 or 350 hour project sizes
instead of 12 week full-time projects. GSoC will accept applicants who
are not students, before it was limited to students.

For more background on QEMU internships, check out this video:
https://www.youtube.com/watch?v=xNVCX7YMUL8

Please let me know if you have any questions!

Stefan

