Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813C4391A7E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 16:42:24 +0200 (CEST)
Received: from localhost ([::1]:47192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llujn-00070X-Js
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 10:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lluhu-0004pi-0n
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:40:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lluhn-0007XG-Ru
 for qemu-devel@nongnu.org; Wed, 26 May 2021 10:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622040018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y0xZe74Fat4QsfphJJruuP/Wpy3bOZyg0IYnxSgn1eg=;
 b=Tyed7/LwkAVBiZdEvKK2F95LuiWdjmdMd4liDSC03Rt4Z2rd2oLwNUjPGLnKK160PPSkIB
 OBvwq948J78R2LTykifMVTZCPjjQZAg0B8XDvJW0dLbPkOFQbfaug8yePEBjRYRZRRoMtx
 hDClyrbalIy+wG55EwBgxzm07oE+ZGQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-Y5jEjdF8MT25hIjQkDGsew-1; Wed, 26 May 2021 10:40:16 -0400
X-MC-Unique: Y5jEjdF8MT25hIjQkDGsew-1
Received: by mail-ed1-f71.google.com with SMTP id
 d4-20020aa7ce040000b029038d1d0524d0so722991edv.3
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 07:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y0xZe74Fat4QsfphJJruuP/Wpy3bOZyg0IYnxSgn1eg=;
 b=fS4UTaZmeAfKQrTV0eTwDVYZLCylH84+7i8whLiPMFgYkmVKU60+mpEdG8VRFVqHgV
 OXsaMhb5AyNCINuNfrTcqdRnLujCnPQOuU9OyITM71cLZtsHGLf7sLI1uQYiP5uXU9Bt
 NWu9yxEyqZXFELYF7bnxUGTjNnxawjKV1Sjg19r4BDHsdFIRkj5Jiu2EuhqY2NZaUg2N
 kZjDaowDTW2ymALGHjPvTmtuhB0Vv3qZ0+2KN7hFJaOsh3NixpjUySHRPvxsZ0qCTpZx
 dHFXKTdo3go47o1GEjgBTc8EuyWsx52E8HqnMxpBrlmw4YBGTZZ0qVSzEp4RtnAOlodP
 m5Xg==
X-Gm-Message-State: AOAM532RUav1LITE11spYmN0NNLgYPHaVDkez9+y+g6JcsGVr5U5cAIV
 l5QPsvRSoStAgdtBkIbjU/uJcC/JT81KaNAelp3yTsLXD4lOqH7AbH/sPskQ9KUEtcBVogM1ktN
 CdbJTeDxOqvEGhI8MAg6NE6jLSvdhckeClyNF6XDQvI/V1kMFXtZg3T2pGGuKtPjQZkc=
X-Received: by 2002:a17:907:a06b:: with SMTP id
 ia11mr2163925ejc.528.1622040014613; 
 Wed, 26 May 2021 07:40:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxjclLoAjy6jipkz1dWPkX3SBcHW0HQedWfKEtdpw1ysF7gj6SyN/XLnFJ6Ug8WT9CkujD7A==
X-Received: by 2002:a17:907:a06b:: with SMTP id
 ia11mr2163907ejc.528.1622040014400; 
 Wed, 26 May 2021 07:40:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x16sm10371124eju.30.2021.05.26.07.40.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 07:40:13 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] tests/qtest/virtio-scsi-test: add unmap large LBA
 with 4k blocks test
To: Kit Westneat <kit.westneat@gmail.com>, qemu-devel@nongnu.org
References: <20210525194607.553291-1-kit.westneat@gmail.com>
 <20210525194607.553291-3-kit.westneat@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3394c913-3478-734b-2c6b-8f213d889ab4@redhat.com>
Date: Wed, 26 May 2021 16:40:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210525194607.553291-3-kit.westneat@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 25/05/21 21:46, Kit Westneat wrote:
> +static void *virtio_scsi_setup_4k(GString *cmd_line, void *arg)
> +{
> +    g_string_append(cmd_line,
> +                    " -drive file=blkdebug::null-co://,"
> +                    "file.image.read-zeroes=on,"
> +                    "if=none,id=dr1,format=raw,file.blocksize=4k "
> +                    "-device scsi-hd,drive=dr1,lun=0,scsi-id=1");

Instead of having patches 1+3, I think it's enough to use "-device 
scsi-hd,...,logical_block_size=4096".

Thanks,

Paolo


