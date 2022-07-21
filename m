Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EE357CEA2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 17:10:38 +0200 (CEST)
Received: from localhost ([::1]:52336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEXoz-0007ZV-9A
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 11:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oEXmO-0004Ef-9b
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 11:07:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oEXmL-0006xX-88
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 11:07:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658416072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4z7+1SPpoZbs0mQb5gGweKdUCYHUIcdGKu2WOljqDHs=;
 b=A7XP0AiAxGuK1aSRLt3wCFXs/4o4g8paPP5/itqWfDQlMpvbyixWPPAJoIscKGCvTzyeB3
 Rt5ND5ZfYILTtZ4NQhsnOFIBavbE9OTDQNqf322rrSbgDXT9NBEyMhnjweVjOD4Zy0ZBVa
 3anVaMQdeDq4iki1oh/f7ONcsptXouA=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-DbrwFiwJNp-JUGHZh-uhmg-1; Thu, 21 Jul 2022 11:07:37 -0400
X-MC-Unique: DbrwFiwJNp-JUGHZh-uhmg-1
Received: by mail-oo1-f70.google.com with SMTP id
 g24-20020a4a6b18000000b0042886f34138so144305ooc.19
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 08:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4z7+1SPpoZbs0mQb5gGweKdUCYHUIcdGKu2WOljqDHs=;
 b=7Ve4vJw60H2CEg6bYPIKi0u6KVuJn7Pv4o9BPvV1fGMHoTj/CX/CPC2Q1ieZPmXNCo
 juQGn4tm5J9LQV7N0r+rvYri+c1cRfsrvYyzVfFvQ3EVljSfvbOqHRT7Fxo1hRzVuscC
 3nlrREht/FhjgmiBqL2IejCVmH9TvS8LYBgr3sQXlYXC7V8jZuF7fPlsPqGgXA8mgOb9
 nYtUE1ydSpqUj3Uu/XAzW398kIUQdWnHMWqcctjZPpNIYv4BXEh6JtuvNSov3UqvU5d+
 dF0WVJ77W7psATIv1hIR61+HpfMMjzQHnOQy4UhDUs7l5xqUbq1DF+UPn6kBBQxrxlPM
 mF7A==
X-Gm-Message-State: AJIora+zJZigKdBSQSfptFvcY1hDUQk0GvFCZ06sRlk88+DxcItPQglb
 jY9Iy4J9W2rEP21m7N3zGy512t+7fUh6Cgqi2L/7xJkOKVIcbpn4jFOivsbgvM0uCjeIsm3pewP
 Xl3hF5SyPfd6eZXhFwS6p0a4NBVQ4tZI=
X-Received: by 2002:a05:6808:23d4:b0:337:e764:90eb with SMTP id
 bq20-20020a05680823d400b00337e76490ebmr5008790oib.205.1658416057246; 
 Thu, 21 Jul 2022 08:07:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vUAQMNq3n4sw5GEtdSAx7QlVuoidmX2H8d8IIu7E8ux7hUtcdFotgf/yd7YIf9Qc6WPt5bm/mcFOadvuVLuTQ=
X-Received: by 2002:a05:6808:23d4:b0:337:e764:90eb with SMTP id
 bq20-20020a05680823d400b00337e76490ebmr5008779oib.205.1658416057088; Thu, 21
 Jul 2022 08:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220721132256.2171-1-frankja@linux.ibm.com>
 <20220721132256.2171-8-frankja@linux.ibm.com>
In-Reply-To: <20220721132256.2171-8-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 21 Jul 2022 19:07:25 +0400
Message-ID: <CAMxuvaz7uzVAX5RYUyh5E4vPfWsV+-FdFgDKakn+BfRHCX5c_A@mail.gmail.com>
Subject: Re: [PATCH v3 07/14] dump: Swap segment and section header locations
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, seiden@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Hi

On Thu, Jul 21, 2022 at 5:23 PM Janosch Frank <frankja@linux.ibm.com> wrote:
>
> For the upcoming string table and arch section support we need to
> modify the elf layout a bit. Instead of the segments, i.e. the guest's
> memory contents, beeing the last area the section data will live at
> the end of the file. This will allow us to write the section data
> after all guest memory has been dumped which is important for the s390
> PV dump support.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 980702d476..6f3274c5af 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -590,6 +590,9 @@ static void dump_begin(DumpState *s, Error **errp)
>       *   --------------
>       *   |  memory     |
>       *   --------------
> +     *   |  sectn data |
> +     *   --------------
> +
>       *
>       * we only know where the memory is saved after we write elf note into
>       * vmcore.
> @@ -1817,18 +1820,18 @@ static void dump_init(DumpState *s, int fd, bool has_format,
>          }
>      }
>
> +    tmp = (s->phdr_num == PN_XNUM) ? s->sh_info : s->phdr_num;
>      if (dump_is_64bit(s)) {
> -        s->phdr_offset = sizeof(Elf64_Ehdr);
> -        s->shdr_offset = s->phdr_offset + sizeof(Elf64_Phdr) * s->phdr_num;
> -        s->note_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
> -        s->memory_offset = s->note_offset + s->note_size;
> +        s->shdr_offset = sizeof(Elf64_Ehdr);
> +        s->phdr_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
> +        s->note_offset = s->phdr_offset + sizeof(Elf64_Phdr) * tmp;
>      } else {
> -
> -        s->phdr_offset = sizeof(Elf32_Ehdr);
> -        s->shdr_offset = s->phdr_offset + sizeof(Elf32_Phdr) * s->phdr_num;
> -        s->note_offset = s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr_num;
> -        s->memory_offset = s->note_offset + s->note_size;
> +        s->shdr_offset = sizeof(Elf32_Ehdr);
> +        s->phdr_offset = s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr_num;
> +        s->note_offset = s->phdr_offset + sizeof(Elf32_Phdr) * tmp;
>      }
> +    s->memory_offset = s->note_offset + s->note_size;
> +    s->section_offset = s->memory_offset + s->total_size;

Ah! section_offset was actually added from commit e71d353360 ("dump:
Add more offset variables"), but unused until now. It's worth
explaining in the commit message.

>
>      return;
>
> --
> 2.34.1
>


