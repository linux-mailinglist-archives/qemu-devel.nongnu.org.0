Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02263531550
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 19:36:36 +0200 (CEST)
Received: from localhost ([::1]:33312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntByt-00055y-4a
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 13:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ntBxZ-0004Bp-ER
 for qemu-devel@nongnu.org; Mon, 23 May 2022 13:35:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ntBxW-00088u-VC
 for qemu-devel@nongnu.org; Mon, 23 May 2022 13:35:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653327308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RNVvKOJa4H7FA/v7Hx9vM5mUhxaN32QiD697Uow6rNY=;
 b=C91iBh6zHJIk0J62A3yRAemHW0m9IUlhN3RX1i8lsqKEhkENXhk/vbYDig4m+WBA+up5T/
 Yh/k7vYZcnM7KSbaA3ag9mGptQHE+3icQHhmjeKsxI6k04ygx+Pfl5sg7F+u+OZmSZTuAK
 NWbp+dSCJwmbbApAOmjdFHXy033rxZU=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-A7wzzCnkNHC3J5KagfrK7g-1; Mon, 23 May 2022 13:35:07 -0400
X-MC-Unique: A7wzzCnkNHC3J5KagfrK7g-1
Received: by mail-yb1-f197.google.com with SMTP id
 j2-20020a2597c2000000b0064b3e54191aso13590234ybo.20
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 10:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RNVvKOJa4H7FA/v7Hx9vM5mUhxaN32QiD697Uow6rNY=;
 b=RGO8StVNYBkJEBwvhrcY3yRTcgYP/nVSw7ve+rXrlElh4PO7C+nsmjmlob+MqvWHXT
 u7ZriDmXttIdAWZVFITDAcE82KHK3ugjEwJlpzyXjs0iCdaE8h0h42W9ZibtgWJW2NQx
 M1un3QqLAeNF3B8i62jQUyts4XRAE77sFSUwEO1xWXfsVo05o0P2EONoteUj/D1vj3bb
 o6ZaJFs6mmLE4jnS/CYph/5t+5ammeOVQKI7vWYYIEh5AfW1SAx02vCqCeG0xQrWvyte
 H0uuvRblr7fWPkdLOlo1CeIwtOvXTekdq64WP8KSB/5b//ucg0jgbhWGVxx9Yt53JSqO
 1Xrw==
X-Gm-Message-State: AOAM532awiodEd5Lcqi7nDWxQv4bmNZdERs1Sy4/RHcXrjkX36Gz838z
 3Km1gVnW4Gyajiy6YYMsoJvUY4YRia6/CZlXCLzVU4M9jN1RDIIoXZEMh41diSIRscu1xkGzhsm
 14kdbvCJIz4QXtVw4b+8JdgE5AQOSgXk=
X-Received: by 2002:a81:3d09:0:b0:2ff:51cc:fb52 with SMTP id
 k9-20020a813d09000000b002ff51ccfb52mr24413469ywa.456.1653327306680; 
 Mon, 23 May 2022 10:35:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyb8wLTTEzWAEqPXGnYH7Y/T7m6/ZdJ+nmVAa+vCiYxR7RnVTsoHgsJGBVMNMxmUVUGZwNWQMB8NlSycHUsFYM=
X-Received: by 2002:a81:3d09:0:b0:2ff:51cc:fb52 with SMTP id
 k9-20020a813d09000000b002ff51ccfb52mr24413453ywa.456.1653327306503; Mon, 23
 May 2022 10:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220523145610.809663-1-kkostiuk@redhat.com>
In-Reply-To: <20220523145610.809663-1-kkostiuk@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 23 May 2022 19:34:54 +0200
Message-ID: <CAMxuvay25hx1vvKNWbRH=BmA2Jhd09sfbDc5jhAY4Ai9rQmwaw@mail.gmail.com>
Subject: Re: [PATCH] trivial: qga: Log version on start
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
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

On Mon, May 23, 2022 at 4:56 PM Konstantin Kostiuk <kkostiuk@redhat.com> wr=
ote:
>
> Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>

why not, and why not QEMU_FULL_VERSION? :)
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  qga/main.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/qga/main.c b/qga/main.c
> index 3b9546c185..a58368c75e 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -1271,6 +1271,8 @@ static GAState *initialize_agent(GAConfig *config, =
int socket_activation)
>      g_log_set_fatal_mask(NULL, G_LOG_LEVEL_ERROR);
>      ga_enable_logging(s);
>
> +    g_debug("Guest agent version %s started", QEMU_VERSION);
> +
>  #ifdef _WIN32
>      /* On win32 the state directory is application specific (be it the d=
efault
>       * or a user override). We got past the command line parsing; let's =
create
> --
> 2.25.1
>


