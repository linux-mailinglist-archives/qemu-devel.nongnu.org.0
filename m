Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB344F1105
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 10:31:35 +0200 (CEST)
Received: from localhost ([::1]:50636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbI7Z-0001eQ-2g
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 04:31:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nbI5p-0000qL-ID
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 04:29:45 -0400
Received: from [2607:f8b0:4864:20::52a] (port=44778
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nbI5l-00071u-Cd
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 04:29:45 -0400
Received: by mail-pg1-x52a.google.com with SMTP id c11so7734458pgu.11
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 01:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/4D2WSaY2NCo0kq7rXRfxSiWXKROEc4rND8fpzR1AO4=;
 b=J9wev7hkegm0mOY5v2z6SSO0VV3jbKl/gqfW7RKfpbhaQXFeHgWr2/V5hpE/tVpK/g
 gvN2CK510klhettpwZcI70uviNPCR+mqGyRHVg3q06/BQaPKenUWnA0a54wqbWr1p5fV
 aaDT4pqO5I310uokDaouV/5RZZLTnlBytiRL0QU6EK3vlmpeYsGJNd8gyFx19Dyht9th
 IBI6V6M4AbIW9EXjhlzkzfO0W9kBKjXBe62uzbKiy/67yFTLAMKy3JJfKmlHLIbyeIWE
 f7VAG0d/wSpj4cUg0u1YXTnqUVv/54W1EbEo1YdY6giOfZAWWszqM07ZtKAquhUfnwLm
 qLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/4D2WSaY2NCo0kq7rXRfxSiWXKROEc4rND8fpzR1AO4=;
 b=b7IFQz2xiNh4Ffq6vTZrW3ZPPIfp8WRQHuBHjSx+AFzbwlB94Rkg5pZFyykbkFdoBs
 AkOmvZtBqkuFxMLy7QaHU9ZXKbSSUgZSV4JDR+XelEDh5tAj/mlsqeZvRCc8XdRXG70g
 Wt2TUPH414iVOxnKG0DJD9G0GceU4mYSDl/PDB67gBugY4TVyXrfAj0QzOOVGsLYaZjQ
 et304zdI9iaWpo1Zo5DyggPrwsy6POcnNFkF9oHw8pqXy5Ni0SqGXd82mlAwqbJR/Ec+
 XL/ZFTgYZG7n08wunGyUFSCtNF7BBmT7oNXDu3gebpxorCHDzjo2rstOtrXv/O8a1RXj
 A5gQ==
X-Gm-Message-State: AOAM531h3AtUPuhpBszlEm610Bg4jPPE6h1Qv/dVCe3ktceokxEz77Im
 ftvv8C2paqosnlhXb7w2N0jxBgW5qBYK67w2jMU=
X-Google-Smtp-Source: ABdhPJxxd9p7LrCQb8BjCeFwvvfukCwq4hK4i+7IQTRqjFLmydMrcODtRYIHr7br3Tm/NXqpBGPr2kFZCP02Y+ZDkFM=
X-Received: by 2002:a63:3fc7:0:b0:398:aad3:3ce1 with SMTP id
 m190-20020a633fc7000000b00398aad33ce1mr21026376pga.461.1649060979956; Mon, 04
 Apr 2022 01:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220403072148.9248-1-sakshikaushik717@gmail.com>
 <Ykn5qQzvp/+s6ulH@stefanha-x1.localdomain>
 <CAFt73e_Rku3pgQ+YAj-zAcrq36JJd1A1pBA-AX8JMrqRY0f5TA@mail.gmail.com>
In-Reply-To: <CAFt73e_Rku3pgQ+YAj-zAcrq36JJd1A1pBA-AX8JMrqRY0f5TA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 4 Apr 2022 09:29:29 +0100
Message-ID: <CAJSP0QW1Z-wVwNW7rKYwLLn5Sv5C8K_DwbTK1NE0MxN1rHpoxg@mail.gmail.com>
Subject: Re: [PATCH] [PATCH RFC v2] Implements Backend Program conventions for
 vhost-user-scsi
To: Sakshi Kaushik <sakshikaushik717@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=stefanha@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Apr 2022 at 00:16, Sakshi Kaushik <sakshikaushik717@gmail.com> wrote:
> I have made the suggested changes and submitted v3.
> But I am not sure how to check this code by running it? When I try to run the .c code I get the error message: 'qemu/osdep.h' no such file or directory.
>
> I have followed the building step without error. Not sure if I'm doing it correctly.

The executable will be in
build/contrib/vhost-user-scsi/vhost-user-scsi after you run 'make'. If
you ran make from the root of the QEMU source tree you can run the
program like this:

  $ build/contrib/vhost-user-scsi/vhost-user-scsi

This will let you check that the new command-line options work and
that the help output is updated.

The simplest way to check that vhost-user-scsi is listening on the
given UNIX domain socket path (--socket-path) or file descriptor
(--fd) is using:

  $ netstat --unix --listening --program

This shows all processes that are listening on a UNIX domain socket.
You can search for the PID of the vhost-user-scsi process to see if
it's listed.

Stefan

