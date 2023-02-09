Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41DD690CD7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 16:24:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ8mW-0002Ll-NM; Thu, 09 Feb 2023 10:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQ8mB-0002H7-OH
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:23:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pQ8mA-0000KW-Du
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 10:23:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675956233;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=04h0uLD/vq3QBUpa5tMwOouoYQQym5gXoVFMQL0veS8=;
 b=P51tXw0uWs2W2T9YgACXqz9bJBX4TMUGxeNTBR9JAXYpeoiddERV2QY+9JYYWqG7YcDMqP
 6T79uslRKMekZCPOtOeZnjn3PeryuhGnYiPGffJGonLMkWgkwzqvMO/gzsSzGJx8hnaJfQ
 ULXUiaWOa+4TdlbeIh8/oVMdU8kUcpc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-500-KAhYbcUxPsa_wly-6KxIuA-1; Thu, 09 Feb 2023 10:23:52 -0500
X-MC-Unique: KAhYbcUxPsa_wly-6KxIuA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l38-20020a05600c1d2600b003ddff4b9a40so1140915wms.9
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 07:23:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=04h0uLD/vq3QBUpa5tMwOouoYQQym5gXoVFMQL0veS8=;
 b=kc106oM5cEj1ewVVf5uIo5sfgU4L+Dds3ugT9f2CXCLJfrzPTFJj3sa/67uXSTsPWn
 /8ik2ZNfveooacXMetbfmrBEj/RQsvTd0atgvCT/0JUtrJ0A6lHkQaUvmcpuQGrfRcSB
 L+opdZUTPQ8i68zh6YHmXMj1aaBu8CWciHnh2sRb+iFbNJ0unzq+aDMq7j3lKgdWf295
 NZOkUIi89ukMd5YUk2/4f0iPFx9UJAtEUGf/DImJRLiTWqf/qsv3wC6E/fvGu0zLoQWH
 p3/+0oEzwbS9lcT0o/R38xddrMR0ffc1DCCsPTXEKPbV35954xA9gsgv/F0XrDIYprbO
 AbXQ==
X-Gm-Message-State: AO0yUKXW5b2WqCrFXe0nlJ2RFmj8wLzHXKsS7GktiqQtOaQk+fk3ZeTG
 48mPKJajmBtDk969BGmBIb+FBTNRh3hKlZJCnuCBv1a8iDvZ3qbxbGn70waC45etOBINhlUwU8I
 FH19vMQ9wQGb/Ks0LqUxorDS6pQRVGjllJmddwHQfd1rLWwD0BDm8FDu6swk1eo5lLqXmLXOnho
 8=
X-Received: by 2002:a05:600c:4d22:b0:3db:1200:996e with SMTP id
 u34-20020a05600c4d2200b003db1200996emr10305159wmp.16.1675956230925; 
 Thu, 09 Feb 2023 07:23:50 -0800 (PST)
X-Google-Smtp-Source: AK7set930EjazNuDT9/gxEhgLalkBGaEmlDKy/944+ZB+3Y1Z1go64bP+1FJ2IibSj6zaxYQC/w+Fg==
X-Received: by 2002:a05:600c:4d22:b0:3db:1200:996e with SMTP id
 u34-20020a05600c4d2200b003db1200996emr10305143wmp.16.1675956230676; 
 Thu, 09 Feb 2023 07:23:50 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 i16-20020a05600c4b1000b003dc4fd6e624sm2070308wmp.19.2023.02.09.07.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 07:23:50 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] migration: I messed state_pending_exact/estimate
In-Reply-To: <20230209133115.31681-1-quintela@redhat.com> (Juan Quintela's
 message of "Thu, 9 Feb 2023 14:31:15 +0100")
References: <20230209133115.31681-1-quintela@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 09 Feb 2023 16:23:48 +0100
Message-ID: <878rh650cb.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Juan Quintela <quintela@redhat.com> wrote:
> And called then in the wrong place.
>
> Thanks to Avihai Horon <avihaih@nvidia.com> for finding it.
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Nack.

Sent another version with the commit information when the messed up
camed in.


