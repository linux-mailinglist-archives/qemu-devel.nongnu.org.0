Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AAC5FE576
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 00:38:19 +0200 (CEST)
Received: from localhost ([::1]:39498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj6qI-0006G5-6o
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 18:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oj6ou-0004VY-Aj
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 18:36:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oj6os-0004Xm-SS
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 18:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665700609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SvSIAUrjJP/aI3e3XHwepb+xAJAqJVl68OPw0QQP/f0=;
 b=V2erJR7tMzbccgQFzmMyUp+Zf1Jqver/DJyYlpPkA6n2Xc5hnheeEzg7HeliCpEloMyoDN
 dKlajho7QmaoAz54zFSoohsfiYOTJaIDZ4NTtVdz0H8xp5EYeBGQGij2B3hUPcLzIb6g3w
 KJkpbPjVwCg4KI352XoeAkT6xGx5qck=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-K1aT4Ej2NCaTSQvv-cQN7g-1; Thu, 13 Oct 2022 18:36:42 -0400
X-MC-Unique: K1aT4Ej2NCaTSQvv-cQN7g-1
Received: by mail-lj1-f198.google.com with SMTP id
 q2-20020a2e9142000000b0026fb4a249c1so1363061ljg.2
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 15:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SvSIAUrjJP/aI3e3XHwepb+xAJAqJVl68OPw0QQP/f0=;
 b=ay3lngDVCAEJO4YhvFyulhYAuA8/znbWPb/kyPkI0i0pREJ+KOrcg30hfwc5E2CRc7
 3EcLQSEdaln6AeRA6/fkRw33ly+hVpqoiFUqjH7XnoR4I6MblEMXg+yJah1ZHDGywqCJ
 W7RX7WfCrRT5YaRzPgHX/vMp7ibvOoB4Kmgyqv8aJjh1ZCRnIg9gyQV2rF2PSydOQkFf
 o9ficCTSaD0BWqx3dsaIRCq/OjpJwR7lRX/k0Y7SCDqJecFRjgjzGWNWsH0GaIc8NNeI
 QT+o2gcq2c5dQbg6dTUSBEMRH7Y4N1uc80BHDeTp5eIYPQGqrm3SJDp9FIknt5Dok71D
 dV1w==
X-Gm-Message-State: ACrzQf1O/82M6zfEuKJ6gHh6tz9pSEVOEExNwy40kkIb6nDU0rzWKHyA
 IaKZWgRBCeriNcLtoQYkZIe4d+QhBnEQWtiAGoZsT9iFW53JEl6OWWn/hXqzZALRmsuA1BDyjNE
 922Y65Rad1iJvjjO1pRE89CV0Kr46U0w=
X-Received: by 2002:a05:6512:228b:b0:4a2:3e53:4af2 with SMTP id
 f11-20020a056512228b00b004a23e534af2mr620643lfu.280.1665700601326; 
 Thu, 13 Oct 2022 15:36:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6fdH4KoOQy6vl8PIbovVmy4awWaxfxMjwZvwx2puvwO8P3YMpgHM+U7eyw4DadkVYCKk9ISoX9v8N8u6asFLs=
X-Received: by 2002:a05:6512:228b:b0:4a2:3e53:4af2 with SMTP id
 f11-20020a056512228b00b004a23e534af2mr620634lfu.280.1665700600983; Thu, 13
 Oct 2022 15:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220928090312.2537-1-dinglimin@cmss.chinamobile.com>
In-Reply-To: <20220928090312.2537-1-dinglimin@cmss.chinamobile.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 13 Oct 2022 18:36:29 -0400
Message-ID: <CAFn=p-Yw3mjzfV-WaaX+D4zVGrPQ_zcrVXf9U2+7TRuBuLNEog@mail.gmail.com>
Subject: Re: [PATCH] vmstate-static-checker:remove this redundant return
To: dinglimin <dinglimin@cmss.chinamobile.com>
Cc: thuth@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org, 
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Sep 28, 2022 at 5:06 AM dinglimin
<dinglimin@cmss.chinamobile.com> wrote:
>
> Jump statements, such as return and continue let you
> change the default flow of program execution,
> but jump statements that direct the control flow to
> the original direction are just a waste of keystrokes.
>
> Signed-off-by: dinglimin <dinglimin@cmss.chinamobile.com>
> ---
>  scripts/vmstate-static-checker.py | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/vmstate-static-checker.py b/scripts/vmstate-static-checker.py
> index b369388360..dfeee8231a 100755
> --- a/scripts/vmstate-static-checker.py
> +++ b/scripts/vmstate-static-checker.py
> @@ -367,7 +367,6 @@ def check_machine_type(s, d):
>      if s["Name"] != d["Name"]:
>          print("Warning: checking incompatible machine types:", end=' ')
>          print("\"" + s["Name"] + "\", \"" + d["Name"] + "\"")
> -    return
>
>
>  def main():
> --
> 2.30.0.windows.2
>

This can go through the trivial branch.

Reviewed-by: John Snow <jsnow@redhat.com>


