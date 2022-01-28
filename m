Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5120E49F61F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 10:19:37 +0100 (CET)
Received: from localhost ([::1]:36418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDNPs-0007pz-DL
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 04:19:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nDNEj-0007fv-9E
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 04:08:06 -0500
Received: from [2a00:1450:4864:20::532] (port=37864
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nDNEh-0004D3-NY
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 04:08:04 -0500
Received: by mail-ed1-x532.google.com with SMTP id c24so8543393edy.4
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 01:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xs1yAfGX6iIjMKaOcIHtWfMt4QbIsVDhMVaBuTyFsJk=;
 b=vL3bwEKAeBT3E0o1U+QE07+IIzHC0DQwz0gdj8JNR2KiHklxhigGS6bNYSyTmHJlxV
 nswua49zmfZ2puIhEN7QsXqwQdO48zYKwLkM+MBvmP2Cei58zRchfB226LlLQXTcOsAD
 S92eJFS/gqyfCchD9rSg2VYis5yra2qNV8XOhRFackcKoPpjRmG3Jvs5lslmwWA6XWny
 oAtblZGpQ+/effWeG80dPjzKLkVX84FKLIPwHnLbkPh01akW35uYYHLbWrmPbzM8w5r9
 OfgJYRE0fkXjHz5mgwcH2zFHbN0pgNKSrZPXOB5ORRPUBAMAc7o1HaoKUZoodIMZVqey
 TbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xs1yAfGX6iIjMKaOcIHtWfMt4QbIsVDhMVaBuTyFsJk=;
 b=JdGYUhBqrrpD2PiOyBkbxzA4nkYyJJlPqX1H4WDWzqIZEfea6YMHP8V+0Htfgohql7
 yEtVHxXQR84eRvH3ICCbWtb833nSfpLT+P7i1TyPu47aUu20rQe9i1vuf0Piw4BF+f6A
 xQntawV3S4Wv6xd8AdBtwkA7+gJ6EbpnMGvcGEQNHRqMuHJPuvhrRaspL0iEs3bFxkER
 oqxwuiQB3y29fOejAAlUQ9OqUDsR3HPaiVhZxf9+qu6iaYupv0slfgUE5ELf3BPyMWQ+
 e6AMeCaXtzucvq3BmLeiDrYFooaQyo928pnXEXKEkd+F8hWPDufzWD1b2IQcGvpHldxt
 iALw==
X-Gm-Message-State: AOAM5310XUUHmSLKsQB6xH7H9sYE/uwobBVediTT+b19EJ9Q6iLTjviU
 V5LwuE7Lee0Tsjp9t6TJQRpvHU/2eKuSqqXG42bBBUo0GfFKGg==
X-Google-Smtp-Source: ABdhPJyjn8eUmefZr6zTPVSiAXzdH0XldSzmVAdc4mWYYEXgxIiltqHIkI/G7/SePrt0V3z9gs37C+HGuLLbUFG9aLA=
X-Received: by 2002:a17:907:6e09:: with SMTP id
 sd9mr2221602ejc.259.1643360512593; 
 Fri, 28 Jan 2022 01:01:52 -0800 (PST)
MIME-Version: 1.0
References: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
 <1643214514-2839-7-git-send-email-eric.devolder@oracle.com>
 <alpine.OSX.2.20.2201271401250.42000@athabasca.local>
 <1f544cb3-7434-3480-63fc-ff317327ea78@oracle.com>
 <20220127193136-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220127193136-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 28 Jan 2022 14:31:41 +0530
Message-ID: <CAARzgwzs38AWQtbvMnbAzcoJqv1MAqzU60HCxmAnhMRhW9sL2A@mail.gmail.com>
Subject: Re: [PATCH v14 06/10] ACPI ERST: build the ACPI ERST table
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::532;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x532.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com,
 boris.ostrovsky@oracle.com, Eric DeVolder <eric.devolder@oracle.com>,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > #define SERIALIZATIONINSTRUCTIONCTX(name, \
> >     inst, bit_width, offset) \
> >     BuildSerializationInstructionEntry name = { \
> >         .table_data = table_instruction_data, \
> >         .bar = bar0, \
> >         .instruction = inst, \
> >         .flags = 0, \
> >         .register_bit_width = bit_width, \
> >         .register_offset = offset, \
> >     }
> >     SERIALIZATIONINSTRUCTIONCTX(rd_value_32_val,
> >         INST_READ_REGISTER_VALUE, 32, ERST_VALUE_OFFSET);
> >     SERIALIZATIONINSTRUCTIONCTX(rd_value_32,
> >         INST_READ_REGISTER, 32, ERST_VALUE_OFFSET);
> >     SERIALIZATIONINSTRUCTIONCTX(rd_value_64,
> >         INST_READ_REGISTER, 64, ERST_VALUE_OFFSET);
> >     SERIALIZATIONINSTRUCTIONCTX(wr_value_32_val,
> >         INST_WRITE_REGISTER_VALUE, 32, ERST_VALUE_OFFSET);
> >     SERIALIZATIONINSTRUCTIONCTX(wr_value_32,
> >         INST_WRITE_REGISTER, 32, ERST_VALUE_OFFSET);
> >     SERIALIZATIONINSTRUCTIONCTX(wr_value_64,
> >         INST_WRITE_REGISTER, 64, ERST_VALUE_OFFSET);
> >     SERIALIZATIONINSTRUCTIONCTX(wr_action,
> >         INST_WRITE_REGISTER_VALUE, 32, ERST_ACTION_OFFSET);
> >
> > These are the 7 accessors needed.
>
> not at all sure this one is worth the macro mess.
>

I did not quite have this in my mind when I said macro but it's fine.
We can improve the code later.

