Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DB748DD61
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 19:01:15 +0100 (CET)
Received: from localhost ([::1]:43448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n84PR-0000YZ-Ox
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 13:01:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n84Mu-0007Uk-Jn
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:58:36 -0500
Received: from [2a00:1450:4864:20::52f] (port=41551
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n84Mt-0007XL-02
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:58:36 -0500
Received: by mail-ed1-x52f.google.com with SMTP id t24so26022091edi.8
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 09:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=2MPXN98JKAYUtP7SzP48+Jk6pKVh12xPPphlhX8k1hQ=;
 b=zmoqi2Uz+eEYIAFGpK0ax5IrjhSadWLqnc75/aoM4Y4NM7uLsNCFkZdrVyzylgTydv
 FaIaNfVB/AZQaI47NLm2yj0YosY4qpJlInLrrc5WfSpAmig0PdAXvN/SorvbyI+RATH9
 Xy3TKiJre/laleYBpINyEk2j+LFr9EONrB/cVNry5G1oAl4cuSCL+luWZLSCYwfMF2L1
 ciABw5m/yXip9/Hot7+6v+ixd5tCaAEpPsp24PPU3jzW4pvyrmcaAK7e5EJFdPefX9rj
 Z7VDzWe8SBm1/HfL/WnwN4vbR/mky/5wDOiyNm7j66/v5NQWKJPXJEwiSOIBexb942Oq
 dZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=2MPXN98JKAYUtP7SzP48+Jk6pKVh12xPPphlhX8k1hQ=;
 b=YFBC90hXyiW9CbvhbmmNffzmFLHxOq9SCV/UjaOMABtXUPSZPkBDsTCBKT/nzgPPXi
 XDUXhWzcaQEBLcUEvnxfJ9dBIm2NXmcp3mYUB3FauyTfiuo/xODh1HBsrw2n4Wgli241
 H9cusWwYyD/JkNZdZxTwFVFPjlW+Dx/zYYXq+OilDJCjOCllAztaNpnZM2emUqe7EUJN
 /yy2NKBugrOV0OjJEb2qcpHWn0J5dfQ1Vg/F41kWeyp6L/HDUuzcdEE7l5GRTacNdwge
 Jj7DBxOaiOtaizGHo5nDnqaKuJh5vqW8cPlxXK+KqWtpjxT04mMtcleikLozKTBYTaLT
 VjTQ==
X-Gm-Message-State: AOAM530SxkQex26h4LPq9nlf6onU4UXISoG/psZCQ3igBXvX8KtVOE8h
 RYM+bCt30+fHUpA1eAzChWtLsA==
X-Google-Smtp-Source: ABdhPJwRYSiK4ndx0nTWFvjuU4f9+oYoEvCDTWUAJsOcnxsyOJhVzUrBUAhCPTuFK4nddwIaXi2Ppg==
X-Received: by 2002:a05:6402:5214:: with SMTP id
 s20mr5393629edd.13.1642096713366; 
 Thu, 13 Jan 2022 09:58:33 -0800 (PST)
Received: from smtpclient.apple ([79.115.178.1])
 by smtp.gmail.com with ESMTPSA id kz3sm1093160ejc.71.2022.01.13.09.58.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jan 2022 09:58:32 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: /usr/shared/qemu binaries
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <7403b918-d2c7-1d3f-8ef8-786db90fcbea@redhat.com>
Date: Thu, 13 Jan 2022 19:58:31 +0200
Content-Transfer-Encoding: 7bit
Message-Id: <B7E0D775-5346-4F65-80A2-8B219B5DA213@livius.net>
References: <B9A4B86C-4540-486D-A261-876191FA7424@livius.net>
 <CAKmqyKPBDfxKwqcgzjBDEqoWyjjc3g7PiUOEqptL1vfDfh6H8g@mail.gmail.com>
 <D3A93704-3353-4407-9D47-56FF06BDFB87@livius.net>
 <CAKmqyKO-K-GtrHijVW9jVHTtxgeGdOHm7-Y_290HqtNG4k71eg@mail.gmail.com>
 <1E2E0E52-B384-404C-BD72-5697A611EEC5@livius.net>
 <CAFEAcA_vx48ZavZCHD5_=Ajc9zsWS2ieoDXvRzBAEMBjkR3Rrg@mail.gmail.com>
 <7403b918-d2c7-1d3f-8ef8-786db90fcbea@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52f;
 envelope-from=ilg@livius.net; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 13 Jan 2022, at 19:13, Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
> There must be lots of zeros in there.

I confirm, when compressed, those files get significantly smaller.

> Maybe we should tell QEMU to unpack firmware .gz or .lzo files?

That would be great. I think `.gz` files are easier to create.

Liviu


