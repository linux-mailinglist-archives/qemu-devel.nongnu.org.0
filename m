Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1FE4E6A10
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 21:58:23 +0100 (CET)
Received: from localhost ([::1]:49828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXUXG-0006JW-Um
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 16:58:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUWB-0005en-Cu
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 16:57:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUWA-0000RR-0u
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 16:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648155433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=++uY/vSxRBw7kiUaIsN/kAPJf2lQeFLEucwPRRgqBd0=;
 b=HN9vUW4sFeUcKKL6YFhsJania2UsjZlAGV/jhuEziI4hv7DKoRAzpBRQMJGyGnZfG4lEj9
 6/if9dOruDLR29xe7n6iBxQI9h3MMoXi0N1qCKCXt/6z+k5SWp9XdkmgWPKMblWNj6NeTD
 Z6Y4AVitKd77Yixdoca6yV6Jq2pCnvQ=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-KyZx7DQEMQuJiVnQ-KZfow-1; Thu, 24 Mar 2022 16:57:11 -0400
X-MC-Unique: KyZx7DQEMQuJiVnQ-KZfow-1
Received: by mail-vs1-f72.google.com with SMTP id
 h14-20020a67c58e000000b003253d4b7fa6so1227453vsk.17
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 13:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=++uY/vSxRBw7kiUaIsN/kAPJf2lQeFLEucwPRRgqBd0=;
 b=AYXAHrbdRMNQcRqofZTXHPYgCXmHWIU+3bdnx0kiN8fFbCotxF9QW1mEBF1VXRZsJu
 4hqlVmRmfPQklNwkzYDQmqghxq/GbvsGoqe0T2A4+Hi73aN2ntTTekN3R9lmTs3p7Iwj
 7Dvugodx1Wz7A4kagMArUfe/dJ2/wPdVpEiRa/HRJgHJ7U5FdwYgXvp3gCzHyqeMOrwA
 Dx52xTsxSEuJ5LLdIMATJcsZbF7190f/V3+SUQKGgPJnvfWoz/OY//Qfgxlj/fDYxKbF
 /5n3GRnunFMKQlA3V+zvuIdi6BBC6FO/ntU1s5dVkaBpmQNxdm+HEnjgDEbFiUx2u50w
 Py/Q==
X-Gm-Message-State: AOAM530C0e4+2dHUVWemV1ZBtXNiSwSLkuhGCoQZTCXtZ56iYIKOkymS
 1a7N2Dp9vRFm+wO9mLf5v698EpfJOh0C6pXOC5W9V5qzm2uSwtxTvr8ZrwuU3+Yktc0HgZ7MOTC
 8xrSXjcQXrcUqXScJSD3eQcTVueSo+rk=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr3388158vsx.61.1648155431068; 
 Thu, 24 Mar 2022 13:57:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb+P3mxZt3SQO/1azXhoOqZBeUSMT7QwvWZkLVZXCLFHUZTtbB2i6DoulAzhI6dS9F4DW5aELDHSAXiLDredg=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr3388153vsx.61.1648155430897; Thu, 24
 Mar 2022 13:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-7-victortoso@redhat.com>
In-Reply-To: <20220324175015.232794-7-victortoso@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 24 Mar 2022 16:57:00 -0400
Message-ID: <CAFn=p-Y3Jywf45CyaxwQ+SP6+_ToFJoZ1Lr=8tNQdNLQQaESCg@mail.gmail.com>
Subject: Re: [PATCH 06/14] qapi: fix example of MEMORY_DEVICE_SIZE_CHANGE event
To: Victor Toso <victortoso@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> * qom-path is not optional
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/machine.json | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 42fc68403d..9c460ec450 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1356,7 +1356,8 @@
>  # Example:
>  #
>  # <- { "event": "MEMORY_DEVICE_SIZE_CHANGE",
> -#      "data": { "id": "vm0", "size": 1073741824},
> +#      "data": { "id": "vm0", "size": 1073741824,
> +#                "qom-path": "/machine/unattached/device[2]" },
>  #      "timestamp": { "seconds": 1588168529, "microseconds": 201316 } }
>  #
>  ##
> --
> 2.35.1
>

I'll just assume this is a realistic qom-path and not actually try to check=
 =F0=9F=98=85

Reviewed-by: John Snow <jsnow@redhat.com>


