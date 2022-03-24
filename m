Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 561C04E6A0F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 21:56:05 +0100 (CET)
Received: from localhost ([::1]:47638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXUV2-0004iP-Eu
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 16:56:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUTB-000405-1L
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 16:54:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUT7-0007s9-BO
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 16:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648155244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=szIcK8Q/EhyupLYlFmcyrJqD5lCl33IwG4CNIbcqEqw=;
 b=B77acUpxTcHy1MZDi8AFRz7Yefh8hH6E7xTa279Zv2WG7bdczTmDzWsiAoMjBIXSiKV1Vb
 5SiNnwa+WY4bZcBgSMzDTmnNX7sEh2yIVjEOitYhC8eWvj2+iE5DJUVaz0c6dBJlGbvjPW
 6anys5pOmnTiEvWiAXqL1esJL1751uI=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-XLiDqTcEPfeCc9S7cpjnNQ-1; Thu, 24 Mar 2022 16:54:03 -0400
X-MC-Unique: XLiDqTcEPfeCc9S7cpjnNQ-1
Received: by mail-vs1-f70.google.com with SMTP id
 y10-20020a67c98a000000b00322deefc0d2so1235959vsk.0
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 13:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=szIcK8Q/EhyupLYlFmcyrJqD5lCl33IwG4CNIbcqEqw=;
 b=jucS/LrqL9sLup/NnWiHPWg3diJ4Q3puSd0onvRNPOUv/I55RWfMLwMMghBtDBiEWU
 1PBZLP2uYY4qXCCJmFCWBRhKfiAeEOFJNkyh0tGQkggQwFGjsTVOYrH49py114RKKNsP
 kKWqbDeHrLeTjuzeyInGsaL5OMqpZlDGuzHq3TQlPnkPe8dJZFzqAEMm35hCP62GVAAP
 eNVz9sygedzcCkASrNh5KJqNBVZ92TUp/VSfqihecSlcU1X0OFv/phh5kIQipIaBFlPb
 C+uzeEujl0M6oVDYCn6/tOWDwTxQu30SFtS0TVdpxJxDQ+xK5byyR4IEEsGzjJVhiSTs
 yLPw==
X-Gm-Message-State: AOAM5300XSiUqthrf/l6tHEcuhXcBVJt55oZPq9NIqmgWCQ9hgF7rt8R
 sFHDYUo+mb/Fz4gktBOHTAQ5c1JQ0htlCUA42mLcgfrLlTwqzRur6SIrIKwhU0Cjrm58dIw3smq
 xYCpELLfNc39bRM25lB2FB3rGqE5a/Do=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr3467498vkf.35.1648155242766; 
 Thu, 24 Mar 2022 13:54:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWM1HyG+7tGswN4QKYdBiGby9rDsLZS6Svk3us2hhBWUPU0gMWkzQbf/sCjc/HepyiAHSKdQUFnDQyzxPqrCc=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr3467494vkf.35.1648155242602; Thu, 24 Mar
 2022 13:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-6-victortoso@redhat.com>
In-Reply-To: <20220324175015.232794-6-victortoso@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 24 Mar 2022 16:53:51 -0400
Message-ID: <CAFn=p-bO0Q7466J7SRyDd6eTM_6N8UKLZK38PrucAZqXUxgYeQ@mail.gmail.com>
Subject: Re: [PATCH 05/14] qapi: fix example of DUMP_COMPLETED event
To: Victor Toso <victortoso@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 1:50 PM Victor Toso <victortoso@redhat.com> wrote:
>
> * Timestamp is not optional, let's add for completeness.
> * Add '<-' to signalize it is receiving the data
> * While at it, add extra space before "result" and "total"
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/dump.json | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/qapi/dump.json b/qapi/dump.json
> index f7c4267e3f..d3ed79e8cd 100644
> --- a/qapi/dump.json
> +++ b/qapi/dump.json
> @@ -161,9 +161,10 @@
>  #
>  # Example:
>  #
> -# { "event": "DUMP_COMPLETED",
> -#   "data": {"result": {"total": 1090650112, "status": "completed",
> -#                       "completed": 1090650112} } }
> +# <- { "event": "DUMP_COMPLETED",
> +#      "data": { "result": { "total": 1090650112, "status": "completed",
> +#                            "completed": 1090650112} },
> +#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
>  #
>  ##
>  { 'event': 'DUMP_COMPLETED' ,
> --
> 2.35.1
>

Other events seem to use the timestamp as well, so go for it. I agree
that being able to programmatically verify docstrings is pretty
valuable in an API test suite.

(What date did you choose? Does it mean anything to you? :p)

Reviewed-by: John Snow <jsnow@redhat.com>


