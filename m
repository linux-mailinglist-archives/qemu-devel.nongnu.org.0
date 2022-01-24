Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7E5499DCF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 00:03:35 +0100 (CET)
Received: from localhost ([::1]:42850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC8N4-00072Z-FR
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 18:03:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1nC8KC-0005QL-IZ
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 18:00:36 -0500
Received: from [2a00:1450:4864:20::131] (port=34336
 helo=mail-lf1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1nC8KA-00038v-N3
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 18:00:36 -0500
Received: by mail-lf1-x131.google.com with SMTP id p27so53180078lfa.1
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 15:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=roolebo.dev; s=mail;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NRmtHhvm2vNKMSKuUS2hIErML7045mknXGyMcWgf9ww=;
 b=XzJrGfULvxePvYf+vlXiCW+1+jeJz+yamKHDsbl+P5gb2ZAxgd7uxA7nYC/jIgAY/j
 O7fVyqRzFjIwwZS98bxRitsdjVqddr2DLsKFA1PzD7IRxtLlCqeTXYOy4Mjkym5kFsZb
 KS/91toLtnK6bK65AJzahk/wqMkpN+Y34yYWs8cs7FkDSsvG3SRJLbCpDqOTlzVOVuK0
 5nvzMzQFSNnF4PK/sjE7Gd2Z8HOGkSTWwIU32EUbY/LuqnNs1nAIkL7n7cE0W5ZqmI5K
 OiH5u9Nk/wivIRPZKUnadNaSxsRcpBATnvm981Qg3PMQHJOz5UFzs9dOnxjO5gqnx7wg
 ozdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NRmtHhvm2vNKMSKuUS2hIErML7045mknXGyMcWgf9ww=;
 b=WPypuIEyn7C8MGGnoVeiK2HgRWedmOXVuDuN/96Z03Mgk9Ym37nj4GzVnFkEAm4QRk
 isf/v3W4qY0kygUfTFS1lTR3E+VRcOPuGikq4/Ch42CE6HuuC+6jfd3XV9NB3p4OUCdS
 4dUMjjtpud+Fw6Wq6CubuAQLeqKf+2UkszueL3O+vH6aIMaR8/5l6OLe1zki5xz40srT
 +RurdVsewDUXkG71FvJxE4tDqW7HuJ/tGAFcX/LG1ShkohPUnLIbOKYmXAfhM+nIoPMz
 ct7N9mBnib6MWZMZ4CxwqRmozI9bP0q0mZ5RXDP64FVZBk60hitCfJiQksfmnd+BuiOo
 fwnw==
X-Gm-Message-State: AOAM530R5XyX2VBeYKUEGo4toOU0WAVwPmTtAZSczw57TH4jUcc6hC5A
 yznK0SB2FmBC6LT2x2riB65RhQ==
X-Google-Smtp-Source: ABdhPJyQqv8ubAvBjrQei7YvppTvPQugnfU85XWdHo6ghIU8CDR58r+dK1rjxraeDAjraxcxltUzpA==
X-Received: by 2002:a05:6512:339a:: with SMTP id
 h26mr9262561lfg.625.1643065231806; 
 Mon, 24 Jan 2022 15:00:31 -0800 (PST)
Received: from localhost (ip-185-108-208-32.ip.asarta.ru. [185.108.208.32])
 by smtp.gmail.com with ESMTPSA id j14sm1299204lfe.289.2022.01.24.15.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 15:00:31 -0800 (PST)
Date: Tue, 25 Jan 2022 02:00:30 +0300
From: Roman Bolshakov <roman@roolebo.dev>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v13 2/7] net/vmnet: add vmnet backends to qapi/net
Message-ID: <Ye8vjmFFRLPrhE1Z@roolebo.dev>
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-3-yaroshchuk2000@gmail.com>
 <Ye53sOJekvKrM8iT@roolebo.dev> <7053351.4JHWUSIRgT@silver>
 <Ye7mwcl/rB714vgl@roolebo.dev>
 <CAFEAcA-UE5MmkESRrxdedkzYkc9jp81jzni=-xmivK88gkr6Rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-UE5MmkESRrxdedkzYkc9jp81jzni=-xmivK88gkr6Rw@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::131
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::131;
 envelope-from=roman@roolebo.dev; helo=mail-lf1-x131.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: f4bug@amsat.org, Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>,
 phillip.ennen@gmail.com, jasowang@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 dirty@apple.com, armbru@redhat.com, r.bolshakov@yadro.com, agraf@csgraf.de,
 kraxel@redhat.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 alex.bennee@linaro.org, eblake@redhat.com, phillip@axleos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 24, 2022 at 08:14:31PM +0000, Peter Maydell wrote:
> On Mon, 24 Jan 2022 at 17:49, Roman Bolshakov <roman@roolebo.dev> wrote:
> > I'm not sure why blocks are Objective-C specific. All the data I have
> > shows the opposite [3][4][5]. They're just extensively used in Apple APIs.
> 
> This is true, but for the purposes of our build machinery it is
> simpler to have three types of source files that it deals
> with (C, C++, ObjC) rather than four (C, C++, ObjC, C-that-uses-blocks).
> So unless there's a clear benefit from adding the extra category
> I think we should do the simple thing and keep these files named
> with a ".m" extension.
> 

Fine by me as long as majority finds it's simpler :) Perhaps it's just a
matter of personal preference.

I've used to the fact that platform-specific code uses platform-specific
extensions or some sort of weird "GCC attributes". Therefore C with an
extension is easier to reason for me than Objective-C with ARC and other
kinds of implicit behaviour without an actual Objective-C code.

Thanks,
Roman

