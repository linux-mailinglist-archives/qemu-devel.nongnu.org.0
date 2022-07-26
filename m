Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43D2581209
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 13:35:19 +0200 (CEST)
Received: from localhost ([::1]:48544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGIqM-0001zC-Oh
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 07:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oGIn6-00050u-DI
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:31:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oGIn4-0006xu-Kp
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658835113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wPPKTSsuoIBwLuFT3VQvCw9I2YfXgqO/lfKiClHxXj4=;
 b=hdUgT82mkitAy+fpuBcfwaP+M9b6+oglR37v9D3wylIDHaUXzvgYbWCXEemKmnM6FnPwDm
 OpB5BQYQtcktQiVrfKTAqyd5sWLNI8mjFi2fTZcAYBQaCbOY2ICB24fZKi8aZcmt/GGcg1
 klbe/ezvoVzMCxBpVWB0O4zqjonDm1g=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-75liDv4OOee6mdUMiRK-Fg-1; Tue, 26 Jul 2022 07:31:51 -0400
X-MC-Unique: 75liDv4OOee6mdUMiRK-Fg-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-10dabd8f066so6737109fac.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 04:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wPPKTSsuoIBwLuFT3VQvCw9I2YfXgqO/lfKiClHxXj4=;
 b=MQGrO9j4u/xp/7lyV3xCBwPT77sqqoGnbfZ1cFFVxNBDe5Qjg4UgDtsuMsmung/qBQ
 QfyLNTRqGv/C2Gl8HQ2VJ8IYPdjsrUy9K0QDBdQDRuKgOGdIiHV5R0OsqIdffx8JMxu7
 Gbh5dvzerZDDqUtAAIiMCYBJb2CHUIwC/y2POTduClXqaXh1LvaTlvDBC+0FRQum2tnP
 p5/T95Gj6oJCLmazqrkQdZnSujvVsyhaW4wmsw+QGajTSqIoXaIxkqCpJqAU7cMXCGi9
 HYPe2J/+RgAzrO+UB0PhNtqvdIPqwgn0HJjIebPsaEiJVMXNGd6k44pXHLcnlhu0VH0n
 /I9Q==
X-Gm-Message-State: AJIora82y6IpEz4gXIG5FR2xgJC6vcqc0xogvBwUSGwJ+lD0NY5mN/Am
 FEhIhHSrrhpAa6Bg/GLDGsIuQm+Zo5llDk4pPa8VCqIs83nZKedVI4rkvbFGIFI4sqgnwU1hwnl
 KoMfl3BVIJN67iyK4RM+eFa7RiDTDZow=
X-Received: by 2002:a05:6808:2187:b0:33a:c507:d4f3 with SMTP id
 be7-20020a056808218700b0033ac507d4f3mr7854245oib.205.1658835111020; 
 Tue, 26 Jul 2022 04:31:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vH48HjZj4raguUCk3LFr8XZNqPqO5Fowjd5x2jtTO52TGX6aSRLOQbfA82En7HBKWVxfHe7PRy3vKPz/oEwf8=
X-Received: by 2002:a05:6808:2187:b0:33a:c507:d4f3 with SMTP id
 be7-20020a056808218700b0033ac507d4f3mr7854225oib.205.1658835110842; Tue, 26
 Jul 2022 04:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-6-frankja@linux.ibm.com>
In-Reply-To: <20220726092248.128336-6-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 26 Jul 2022 15:31:40 +0400
Message-ID: <CAMxuvayir+vx8vjxt-wHHGsS0oyrfdzJftm4yikob6OHqoXAFw@mail.gmail.com>
Subject: Re: [PATCH v4 05/17] dump: Cleanup and annotate guest memory related
 DumpState struct members
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, seiden@linux.ibm.com,
 scgl@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jul 26, 2022 at 1:23 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:
>
> We can safely remove next_block and start as both of them aren't used
> anymore due to the block iteration re-work.
>

I suggest removing next_block with the patch that gets rids of its usage.

> Also we add comments to the remaining guest memory related struct
> members and a comment on top to group them.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>

With that change,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  include/sysemu/dump.h | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index 6ce3c24197..24ebb02660 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -166,11 +166,10 @@ typedef struct DumpState {
>      hwaddr memory_offset;
>      int fd;
>
> -    GuestPhysBlock *next_block;
> -    ram_addr_t start;
> -    bool has_filter;
> -    int64_t begin;
> -    int64_t length;
> +    /* Guest memory related data */
> +    bool has_filter;           /* Are we dumping parts of the memory? */
> +    int64_t begin;             /* Start address of the chunk we want to =
dump */
> +    int64_t length;            /* Length of the dump we want to dump */
>
>      uint8_t *note_buf;          /* buffer for notes */
>      size_t note_buf_offset;     /* the writing place in note_buf */
> --
> 2.34.1
>


