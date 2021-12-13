Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE843473448
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 19:45:50 +0100 (CET)
Received: from localhost ([::1]:51894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwqKb-0004vT-V5
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 13:45:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mwqCy-0001W4-8g
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 13:37:56 -0500
Received: from [2a00:1450:4864:20::532] (port=38575
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mwqCw-0006pl-0f
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 13:37:55 -0500
Received: by mail-ed1-x532.google.com with SMTP id z9so701139edb.5
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 10:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LummM/zB4loc4SKhIzTFG1MyNTOmKYwGmrxPWHoHWeI=;
 b=UR/Dbw6QdlmOT57C4BEY8uSmNjafYerog+SR8Al/txCzmZBWJvHAHVCggCKRjgbr8w
 W2y96JP6jWLUgn4RfOEaHDV/Ue9S4DlWdamdqf9PSvh2SN9U+MkAXJ3pmxfdz2MBDiZJ
 MG2lvas627gxWQK9/uh0wiojaswkSiICJ0zfEPpxYMvq+0D4fcNnaWcJX7BXyLNOfzES
 i4fKrWqNbLOo65RE5nZiOrykoCRgCoAtgx4Bcc1s89GhEXmAG/vfKclA4flCmf1fTdTz
 bsbkJ7XZXDMtb5hR3Uqd1UFqZVFl+BTha8K1isDpPV7uSaJom3IUBhoXwz8y59Do96yl
 mMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LummM/zB4loc4SKhIzTFG1MyNTOmKYwGmrxPWHoHWeI=;
 b=4s2k0ojSCLiT679UMhV31/V92ZmBMG763QdmHfwX8lHBVTLP2Ahg1uyqIwOxMo2FpS
 ARDOxgr3eNAPJrasnTi5T3dJyRjr2s+ANN2S9TNE6aoScm5zIGiQR1g6I2L0N9UcXF7k
 tXrc38I8JfIsvg3OUtxqciyNuueRk1ZjBNUjyLTl1H5ZEuJ6ildN0WQRTyKCs1jiJuSb
 dvuo3jOysy1qbKdV11a2NXwIbSI8/rBJm3Hpbvwj+x+jCJ7vebgYQbjY0fTe7KCuS9JO
 AwtnVZfjWh7sZkN35QPlLG073ZiS0MyyMki873zJc5OGir6se5nS3LH2uToGVieyKqqD
 xqng==
X-Gm-Message-State: AOAM531LRMxaNMVlhr/KW8CxOgrvyZwGvrkgM/XtILmBxcvKgddrPwbT
 eGo/XnrDV8JgMXLFxzGpDV8=
X-Google-Smtp-Source: ABdhPJzDxgiMKS8b3UigAGBijsBhxjYQ7LV2fjoLKi2+acGHQ4uY4tP5ZXR7v5KRtOQ/EA/ubkK0VQ==
X-Received: by 2002:a17:906:9b8e:: with SMTP id
 dd14mr79259ejc.337.1639420672486; 
 Mon, 13 Dec 2021 10:37:52 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id b12sm651713edd.26.2021.12.13.10.37.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 10:37:52 -0800 (PST)
Message-ID: <e33c3d09-b507-798c-b18e-df684ec797e2@redhat.com>
Date: Mon, 13 Dec 2021 19:37:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Redesign of QEMU startup & initial configuration
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <87mtl88t0j.fsf@dusky.pond.sub.org>
 <a31201bb-78de-e926-1476-b48b008745c1@redhat.com>
 <878rwozfqm.fsf@dusky.pond.sub.org>
 <16cd5683-4f97-d24c-dd19-24febcab7ba8@redhat.com>
 <YbeL7EjoTtrUrGa2@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YbeL7EjoTtrUrGa2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Mark Burton <mark.burton@greensocs.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Mirela Grujic <mirela.grujic@greensocs.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/21 19:07, Daniel P. Berrangé wrote:
>    - /usr/bin/qemu (or /usr/bin/qemu-vm) - for a high level binary that
>      targets humans and uses a templating system to expose a friendly
>      simple config, that internally invokes whichever target specific
>      /usr/bin/qemu-buildvm-$TARGET is implied, plus any other vhost-user
>      backends, or whatever other helper processes it needs

Adding vhost-user backends and helper processes means one of two things: 
either you are not going to support hotplug, or you are going to redo 
libvirtd with a QMP-based RPC.

Paolo

