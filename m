Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D97644EB4BA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:31:45 +0200 (CEST)
Received: from localhost ([::1]:34466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZIVE-0001aB-H6
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:31:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nZITk-0000LM-Px
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 16:30:12 -0400
Received: from [2607:f8b0:4864:20::436] (port=45034
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nZITj-0004c3-3z
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 16:30:12 -0400
Received: by mail-pf1-x436.google.com with SMTP id w7so14225602pfu.11
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 13:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kl5DSwKqGC3U/bGYtmS8mb6P78mxyrAogm6NAxfi2Ko=;
 b=JXiVVP882Ymx8HWARqLEqO2fUJFthFgVmqtuUJWkV+UqBqJnvN+u0tcofmwZIzPgxn
 SI4dvK4fCDfnRXu+hEf/S9mbvfCX/AYrZNGk7bfoi7nEm9WDd3oNujboVVpj09oIhs1L
 YIiJ6CLX0iD/jGgs7Bn2KyaaZ0Ady8Rw4PNGWvR8gwy6fG254inOGQ1NAL9c2b3NUArp
 QyxoxkG8zroS43DnQiMyOc76zNv4VEii3KKGQBrntS2VYhf+W0S+GiHfSs6ETM5FfLwB
 5RWR1DpXaSq2jZWTPUWJw7q1qGuWRfwQ0S4iLl8wh7u7Z3ctpxryDCvOUAGlHlc4igzk
 iVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kl5DSwKqGC3U/bGYtmS8mb6P78mxyrAogm6NAxfi2Ko=;
 b=ZuVHCykm1x41B/1SsnA1HJJLg63o5wNCVXYTIwUMixhXo0wJ8+HTHWGAqtsuP4/IRs
 pO2pIzetoKjXsR8Y0PIPmjYVQdPqvwMwTryXWlY8/qz3uvu840Bj85DfFVRJSo6fBs/k
 ri4TWdTrGcAWhRF9yEi4VmHym/o76b3Sx85VA67Hxv0SsnogIOsI5SgexUS7B6ft3Uo/
 LYn/8iaqsr9fAET5UqngKLT708xs8xp9bwQHEu3ONsDYX0VKRL32HUF+3f/V+px0hlzD
 Ii4XrRGpc+4Hc1QbkMV52FzNTMrGpdLQkE1mcszjqRfu4D3SNDLrxwk5hs3gnxMZVDi0
 rmcA==
X-Gm-Message-State: AOAM531a0y1syuBgaMHhCa+jBFlz/ITdinCAUT1qfDGjTVxkLct7ET7/
 4ePHZUz45JPHcD+9JbaPJrGfTCgZWNZD9bLl39w=
X-Google-Smtp-Source: ABdhPJyamOcRYfPqXQKZbO7vCaztK/sNspv617BPasRnOyCyXJUc+4gYqF/F7vzaFG7WqV14xC7zF4qjCUZ7q7Hb4p8=
X-Received: by 2002:a63:68c8:0:b0:380:3fbd:2ec9 with SMTP id
 d191-20020a6368c8000000b003803fbd2ec9mr3255952pgc.608.1648585809168; Tue, 29
 Mar 2022 13:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <244647ca-a247-cfc1-d0df-b8c74d434a77@amazon.com>
 <CAJSP0QVqvvN=sbm=XMT8mxHQNcSfNfTrnWJXXf-QgXwxAfzdcA@mail.gmail.com>
 <CAJSP0QUZS=vcruOixYwsC_Nwy2mvgeemuJimSqv98KsKr4BdSQ@mail.gmail.com>
 <da1dd6ee-6f3b-0470-cff3-9c2eb44d0ae6@amazon.com>
In-Reply-To: <da1dd6ee-6f3b-0470-cff3-9c2eb44d0ae6@amazon.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 29 Mar 2022 21:29:58 +0100
Message-ID: <CAJSP0QVrhzuso+=Wdt=mnkc04L332cnW4BmOL-OqA3e8cQCrnw@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Alexander Graf <graf@amazon.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=stefanha@gmail.com; helo=mail-pf1-x436.google.com
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Andra-Irina Paraschiv <andraprs@amazon.com>, kvm <kvm@vger.kernel.org>,
 Sergio Lopez <slp@redhat.com>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 John Snow <jsnow@redhat.com>, Alex Agache <aagch@amazon.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Florescu, Andreea" <fandree@amazon.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, "Eftime,
 Petre" <epetre@amazon.com>, ohering@suse.de, Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Mar 2022 at 13:36, Alexander Graf <graf@amazon.com> wrote:
> Petre literally pointed me to the fact that the project did not end up
> on the wiki page a few hours ago. I added it and augmented the bits
> above. Please let me know if you see anything else missing! :)

Thanks for posting it!

Stefan

