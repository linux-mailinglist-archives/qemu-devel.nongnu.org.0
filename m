Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7541C381FB9
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 18:16:22 +0200 (CEST)
Received: from localhost ([::1]:47712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liJRE-0003HI-Sz
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 12:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liJO2-0000xT-P8
 for qemu-devel@nongnu.org; Sun, 16 May 2021 12:13:02 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liJO0-00057n-AN
 for qemu-devel@nongnu.org; Sun, 16 May 2021 12:13:02 -0400
Received: by mail-ej1-x62c.google.com with SMTP id n2so5607380ejy.7
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 09:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XoynUOz4+iGXyLuogrv4pHtuE2PMOYr63gAjwTVd2q4=;
 b=BA/GkLx4jnQQ+zgByJrsCweIkoElvRx0DRrTU3WPTN+0whSnZiS4s89bsRISrk9rIL
 /5RtoMxty21ubEqESgoCICf55UHpbTlpKhRN5Xo2mmbGX68Mm6r41LASOlApV023v/R2
 X0dBnDz5uWD427v3JCWnkdzkaikbMT6BIN0LP4N+s/ZE3xKSEMRGnjic1v2ZMTznTSG5
 SDValxT9wwatQuIWwIBOmZpnPF0Y07treflNoV4xHzQo8FrT2z4Sc5+sG6yv0YctZxFW
 1RMqGXyFSlDiGqD/7NOUUQJYxNZnDqqbjdiAbN6Jcyhj5kzmPyTY0GLN3HYSsM0JnJlC
 i3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XoynUOz4+iGXyLuogrv4pHtuE2PMOYr63gAjwTVd2q4=;
 b=WeFUiX5lAIPz4n8HCtkuq5swX9PPr0aJsqHU/vN7WPJPa4F5GGUeenEum8rr5mE5Ea
 2wUwNWyrAp7zlBTDC+TsGdmRDtz2Gh8CXY22tgHE4YV7wYYpbDTYdmGr2WAD7Rrqot/X
 6BJs3JoHJ5P806w2KOhNZmC2KN6groLAvX2RkCEe+m2x4Uvt2aneHO2rInxAU7ZgeZQs
 XGmChaZTHM/7vvRxOY9nu8zRRTK3vyaXHR7qf4kPjxbpGpzjQaiiBTBKP3iwQELNFNMk
 PRuHAcUe59tWfFTqxWLEXXWwAmKe3HYheFT3LJhWL2H0DXUiyQHoSLfk5JoU4qfZ71m+
 MFyw==
X-Gm-Message-State: AOAM530uf0gKaW5uZOT0ZPMStlIA2/q7KgEFIoY7ERrtKby1jZ9oiWAl
 aGe0xjLxktf92uh05VjoKYpP6XuWUA3eaqUYLHdKtQ==
X-Google-Smtp-Source: ABdhPJwBg5uIgiYmDli3hIr8YmTR9mdjHjbNEzyKS9ORKbVxcMc3+edHT8vcj0vnZJkYgmVDFHEz78JIPWwdyc6hH+k=
X-Received: by 2002:a17:906:9bd6:: with SMTP id
 de22mr9580474ejc.382.1621181578707; 
 Sun, 16 May 2021 09:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-12-agraf@csgraf.de>
 <CAFEAcA-021U3ehg_jnAHtako-A-GRxqwjqZWotroumUxfPhdGA@mail.gmail.com>
 <223c7fbc-3a07-e97c-04eb-ef38ec3d67fe@csgraf.de>
In-Reply-To: <223c7fbc-3a07-e97c-04eb-ef38ec3d67fe@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 16 May 2021 17:12:44 +0100
Message-ID: <CAFEAcA9zdJeNgeSihuXt4Cc9-yNDDE+Apkx-S8PBwnFidnxoRA@mail.gmail.com>
Subject: Re: [PATCH v6 11/11] hvf: arm: Implement -cpu host
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 16 May 2021 at 12:16, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 28.01.21 17:55, Peter Maydell wrote:
> > Nicer to follow the KVM approach of only doing this once
> > and caching the results in arm_host_cpu_features, so that
> > for a many-cores VM you don't do it once per core.
>
>
> I tend to disagree. This scales nicely with the number of cores you have
> in the system and it's blazingly fast :). I would rather like to
> optimize for simplicity here.

How does "do something once per vCPU" scale better than
"do something once when QEMU starts" ??

I would prefer to optimise for "don't be unnecessarily
different from how we do stuff with KVM", please.

thanks
-- PMM

