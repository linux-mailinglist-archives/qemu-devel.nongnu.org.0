Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8FB6E9D71
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 22:52:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppbFA-0001Qh-9B; Thu, 20 Apr 2023 16:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbF7-0001Pm-Ua
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 16:51:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppbF0-0004NM-Oa
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 16:51:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682023853;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=W3j7UY/mOwFwCHRwi0/8Z8ADEtfTFdfGJk/FdJY2fXw=;
 b=ZYjXApKoi5xBiAPt5TDxGofTN0muvodPnMRZgoeJjLo8chzGpVl57/RW3ndJ3WAW9kI5G+
 bbs783KeXgn2yNFlUdiAFRB2C+dRpXK3CcW4u8ILsqG39WzDmUUkh8IgJ80ysEFeDxoAhI
 cXLrT8fKuTbkgogj74bM31tR97ZCiGk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-gIqeLUb7MW6y0AKfdVkUDQ-1; Thu, 20 Apr 2023 16:50:51 -0400
X-MC-Unique: gIqeLUb7MW6y0AKfdVkUDQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2fb600e570aso319550f8f.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 13:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682023850; x=1684615850;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W3j7UY/mOwFwCHRwi0/8Z8ADEtfTFdfGJk/FdJY2fXw=;
 b=Md3M9IwuxGilnK9fh/MjB5Sw/MXhh917Y+g/m5FLGYjv8mbFInzjgveB8fTMq5MhCu
 2Ef1PFgl1BrJSqCalhd83brjLHgflzJX1y4fUPu+BuHidgrjzPtrSdNVthJODwx6zWGT
 gRpkG9PiDylXiQw1gHweykyVPlGGMSv5bJ2ODqA4RqWpuPL4vZM9BKWcGJyB415HlJhy
 zYMfVzREc0IOHL6cL4pa+5iI6mwNaaeVcCYKNvyC4ML42PtxowPvPWlvBXVrI6FzLA9R
 1x/vWXiwRzkwgg+HeRqPqnapM3pmkXfS1oKXwBQ7BC9VAZhHEgEiGDtYYoCKoiPSSi0m
 HDdA==
X-Gm-Message-State: AAQBX9c+Kx9XlTk7L/1mbjWOFdD72s1DxDpbpMWjV0z7/BMQRPQs/I2n
 6ZLq1FTfXChGUMnt5R87IvqMHhLDq1xKcZQCL+CjvDgTsw0+1cd03Nyu5a5d+iClySfCGvcaF/q
 FYaJcATDOaHXsz5E=
X-Received: by 2002:adf:f98f:0:b0:2fd:c43a:b713 with SMTP id
 f15-20020adff98f000000b002fdc43ab713mr270778wrr.7.1682023850798; 
 Thu, 20 Apr 2023 13:50:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350aNdSyK5SCxsNLM34GqeFqB3JQgfjMvIUacKopJixfFQibAqwcYK5Tr6N4rVvaH1ft9aHolSg==
X-Received: by 2002:adf:f98f:0:b0:2fd:c43a:b713 with SMTP id
 f15-20020adff98f000000b002fdc43ab713mr270768wrr.7.1682023850516; 
 Thu, 20 Apr 2023 13:50:50 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 s13-20020adfeb0d000000b002fb6a79dea0sm2876354wrn.7.2023.04.20.13.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 13:50:49 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] migration: Minor control flow simplification
In-Reply-To: <20230420143551.419229-1-eblake@redhat.com> (Eric Blake's message
 of "Thu, 20 Apr 2023 09:35:51 -0500")
References: <20230420143551.419229-1-eblake@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 22:50:48 +0200
Message-ID: <875y9qwa53.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Eric Blake <eblake@redhat.com> wrote:
> No need to declare a temporary variable.
>
> Suggested-by: Juan Quintela <quintela@redhat.com>
> Fixes: 1df36e8c6289 ("migration: Handle block device inactivation failures better")
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---

Reviewed-by: Juan Quintela <quintela@redhat.com>

Queued one way or another.


