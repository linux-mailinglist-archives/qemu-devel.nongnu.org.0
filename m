Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B212D1017
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 13:09:17 +0100 (CET)
Received: from localhost ([::1]:50662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmFKO-0001Re-S7
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 07:09:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kmEfV-0004yJ-NE
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:27:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kmEfN-0005Ni-Kv
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:27:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607340403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X0FaOz1z3micO3hOpWL9bsJy9Ttapn6ctymx7JyA/7w=;
 b=ihH8N2BkjW7j8Cq1TRp3RoTEqtc55e+OYyCcpGGO7tgX4ZubKa5Kqqy8bOOCZmj9Wt7cCf
 Lwd5SeZib0FxOJMh8sxtv4qrRz0/bNMUlU06KX28hCRYBLYNCO0Owlm24y6jqOQRI83kAe
 XkD2j+wCPDKrr58NFe0vm6+2cpKqNVg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-JvadV7iuPxSCFyjMYP2ypQ-1; Mon, 07 Dec 2020 06:26:41 -0500
X-MC-Unique: JvadV7iuPxSCFyjMYP2ypQ-1
Received: by mail-ed1-f69.google.com with SMTP id r16so5650387eds.13
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 03:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X0FaOz1z3micO3hOpWL9bsJy9Ttapn6ctymx7JyA/7w=;
 b=Wt0LOR9poWpWJTHfaKKIe6JCixLhGnlUMxKJ7V6LrcUCz3CRo5IERRoV3rV6ZUAW71
 l1FbLIvY3aYm6n+HxiTsKlIykR1JOrsjWC5xjPOmzDxsse+UD2D+3e47fRKswmFI+I06
 XMMedNQcawgvEa6Ky4dPmcV4ObpRG2QmLzmdAmX47Dl4d3kX2m5Rb1eL5yclCC8grsnO
 /9In/TEO1jqstTBX24UhXOp/DZwHYWZhbeGSq+ZqO290BfNHsrhiONEhqHvk9WNznvvz
 lVmQ8+N3bVMd4m7ICFMow80bIon+tnK4jRCAwx6d3f7gOkXrD7dUSI0tO6b8UPGfVyC1
 1XlQ==
X-Gm-Message-State: AOAM532CVyAA5Cp2c7IsWUlob37vMHkfy0SmIZKtPLQt3JswFylRxVpt
 fCGpM7E44m9b1Ks6r1iK+gknMeryK0NCnnmwQlqFSWoUnazpj6QwzKES69BEZ/t3MLpAAoQfTOY
 WqJlnfbNu+lg8wKxnhD1sqVs+2LCGx9T4T6HGqJ9tplZA5ZZMhfjEMl2tqU6hO7PQ9SA=
X-Received: by 2002:a17:906:a51:: with SMTP id
 x17mr18618229ejf.97.1607340399342; 
 Mon, 07 Dec 2020 03:26:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTDhAOP6I5fvFg+PfOOCuezPOEC1NLLlD6ywh9GYmKU4O6dBa53cBSKDr4Zkq3FTcikJG1mA==
X-Received: by 2002:a17:906:a51:: with SMTP id
 x17mr18618212ejf.97.1607340399049; 
 Mon, 07 Dec 2020 03:26:39 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id t15sm9937378ejx.88.2020.12.07.03.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 03:26:38 -0800 (PST)
Subject: Re: Why do we have both CONFIG_SOFTMMU and CONFIG_USER_ONLY?
To: Claudio Fontana <cfontana@suse.de>
References: <5176c935-2df0-e300-b1cf-67c7014e5d73@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <03bdd8fe-53cf-e2d9-cdc8-fd1a22b49941@redhat.com>
Date: Mon, 7 Dec 2020 12:26:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <5176c935-2df0-e300-b1cf-67c7014e5d73@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/12/20 12:19, Claudio Fontana wrote:
> As in Subject,
> 
> am I understanding correctly that the one or the other is redundant?
> 
> Should we keep only one of them?

In the code it's not strictly necessary.  However in both Makefiles and 
meson.build it made/makes things a bit clearer.

Paolo


