Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADB14CF085
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 04:44:56 +0100 (CET)
Received: from localhost ([::1]:57236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR4Ip-0003ET-EB
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 22:44:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nR4Hu-0002Cl-Md
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 22:43:58 -0500
Received: from [2a00:1450:4864:20::630] (port=33703
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nR4Hs-0003a3-TS
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 22:43:58 -0500
Received: by mail-ej1-x630.google.com with SMTP id kt27so29178717ejb.0
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 19:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JOMVxtsrcBsFDEV4NTJRvpKqmGVlGIG0Mkw8o3Cme/k=;
 b=aWJ8EfCcY5m/UfqPOzlFiYhppOOpePqidbIswd8CbDFtODcn6j647Fm2mWK/xUY4K6
 D1IGCG+aGzVllDE0zNtVXoU5bInQG5nXY4acuWPJIfeT7SYHzQ++QhHvD1Rm7JG7RJDx
 5R5oGvobpPpBLQIR33N5My33hBRUzytBU84t3mb3pK4LH+osUyRhDhzC7pi5c7xV1OlX
 pZ+Pq2nIfk/c4D1qzRXDqwknZmPo6Inr3c2EyJ+tUnTuftqF0BTLOYvhB3P7zrbc6AOJ
 a7meEc7KHOLdC9ekpX98f38JyoG/6Xl3nZDvr+pjRjNUJNRKwr3ylR1l08SkQcn5VDgp
 x0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JOMVxtsrcBsFDEV4NTJRvpKqmGVlGIG0Mkw8o3Cme/k=;
 b=jd946NO9uPA4vyzWg+EbCLFL04P59YPo9PIxg5sJwE15wjHTgCRGLuIw/KYamgMvk+
 cd9qcfha122GlSNGuHRpPoMvakazHJovSIZXrN18brsEcIKL5Y3c7vh7qYEX8kynhx6p
 p6oN5SAy2tUh/f1LqoFLbcknkH6xlKz8avCcH3Y2tuLqcgcue5c4t7h41ruXGDHkHdkz
 rAeyt8XV6iQEWePOX3nZ7uCO/mZFgzOuLXM0qEEDJvdUI6JgYhtcEz1pjF9/QdF8Z/7N
 RhpBYnakKuClXNv347/y515mcsYod83IsU+UNAXFDKqrBY/f2xA77wC1Hp7NUFmfNLG+
 SOIw==
X-Gm-Message-State: AOAM533VB2Ch83tyTBtCvcuaJS+N7m0pcUslWySILZQNGgfvnmvlV48S
 s4fJ6p+7xCbQYUD4iUL5vFSmnWOLxFsj8c/SPwH1EA==
X-Google-Smtp-Source: ABdhPJw5qLJSTMwg/22OGIXBnh6LuXP7wk34rhOHCFtVc2iYrwaiccNTbUZO3fvkVxzTl1WhL7NFBot8rmO7/JDeUUA=
X-Received: by 2002:a17:906:3a18:b0:6cd:ba45:995f with SMTP id
 z24-20020a1709063a1800b006cdba45995fmr7892874eje.328.1646624635194; Sun, 06
 Mar 2022 19:43:55 -0800 (PST)
MIME-Version: 1.0
References: <20220304154032.2071585-1-ani@anisinha.ca>
 <20220306163605-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220306163605-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 7 Mar 2022 09:13:44 +0530
Message-ID: <CAARzgwxdwKth9EHNK7GEeFTKOQEbhTr8Ts_94HE1oeK5TV3CHw@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::630;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x630.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: imammedo@redhat.com, qemu-devel@nongnu.org, liavalb@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 7, 2022 at 3:06 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Mar 04, 2022 at 09:10:28PM +0530, Ani Sinha wrote:
> > This can allow the guest OS to determine more easily if i8042 controller
> > is present in the system or not, so it doesn't need to do probing of the
> > controller, but just initialize it immediately, before enumerating the
> > ACPI AML namespace.
> >
> > To allow "flexible" indication, I don't hardcode the bit at location 1
> > as on in the IA-PC boot flags, but try to search for i8042 on the ISA
> > bus to verify it exists in the system.
> >
> > Why this is useful you might ask - this patch allows the guest OS to
> > probe and use the i8042 controller without decoding the ACPI AML blob
> > at all. For example, as a developer of the SerenityOS kernel, I might
> > want to allow people to not try to decode the ACPI AML namespace (for
> > now, we still don't support ACPI AML as it's a work in progress), but
> > still to not probe for the i8042 but just use it after looking in the
> > IA-PC boot flags in the ACPI FADT table.
>
> I wonder how will such a guest work on an existing qemu release then.

I do not know about other such guests but looking at Serenity OS which
is the reason of motivation of this work, it seems to work by sending
commands to the command IO port:

https://github.com/SerenityOS/serenity/blob/455224d4766df886a43c19e9c015533c025d40dd/Kernel/Devices/HID/I8042Controller.cpp#L34

>  do_wait_then_write(I8042Port::Command, I8042Command::ReadConfiguration); result.is_error())
> do_write(I8042Port::Command, I8042Command::TestPS2Controller);

etc.

