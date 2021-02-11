Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364133183C1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 03:54:59 +0100 (CET)
Received: from localhost ([::1]:40620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA289-0003Jq-Pt
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 21:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lA26N-0002jy-EM; Wed, 10 Feb 2021 21:53:11 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:42738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lA26L-0000yd-Nc; Wed, 10 Feb 2021 21:53:07 -0500
Received: by mail-pf1-x432.google.com with SMTP id w18so2742412pfu.9;
 Wed, 10 Feb 2021 18:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=WYynIMthZhSDMWCCgCQaBueIooXce92TuG13Z+PO+50=;
 b=tirbBFdVUHLW+f/ZlgNPJ+UjXhcMTAAox/wqpg3YE9hCDUH2pq4I/tXBlqdgMEOcKM
 FoA6spjWoUdUvDe8f6eYZ/DSkB4TbqZMO2cRJ/I6Z4+FbT+GCeVy6Wey5wg0CC9I5N/k
 We66bwFU078gIkw6xboT+4PZXiw0plkCLEeIHLn9WjabdFuHKqTUuQN23N0ty10aDoXl
 IEgZWK0bTPzetlk4vePl5eR7cje1AR+q7B+9d9oj35CT8Aye+wZrSYz7Vtgct7eKLuWn
 jZ5nh+PAfMs7t80Skb2PgvVTZLYRegEjA/qq6SHd058ViI2vXub38+JjHJz4BGzpNvUL
 XmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=WYynIMthZhSDMWCCgCQaBueIooXce92TuG13Z+PO+50=;
 b=Y/zt8YSyuqsdmhiUJY58llj2Awc9d/TgbjQr6VvtQKkS6HOBLUxlxABrdKFVSCzuT5
 VX6m2eOSxjiGT6lxEV5tRY+eTfsyy+rfqAaP63BR3PpcxlA2rETMbEFJbfGLiVNY7K3S
 0Sw7QlZd8ZCD6l6P50iCByxXolKUOwTYpenZAicG6/Do6N528RU/HkQNcnZX/Aox+LNl
 d4XXvOvXL7BuFo8cUtBcZCM5rCEujCutK2URReWEq1T+/NW/jVi/XkN8/bWvoY3cB1+G
 VM53wX6shkulafbMhGR8A6j7/tosEuMzrE9vUtEha0z2LyOEpLKHWIINIFg+4KZ2b+Kz
 qq+Q==
X-Gm-Message-State: AOAM533bOADIRb+cDkYZTlbJknjD+8a2lRQpxDc1KtmRlpwSBceNcYEt
 3C8vDVfzOOpjznrA6/hxg38=
X-Google-Smtp-Source: ABdhPJw9cbGynZXH694SCwnXU77eHX0VnCQqDEi6MXyhjrkGzQlizbnkDSQEjP+OdqREcqwYDCVDWg==
X-Received: by 2002:a62:2702:0:b029:1d1:b92a:ef2a with SMTP id
 n2-20020a6227020000b02901d1b92aef2amr5869076pfn.5.1613011982277; 
 Wed, 10 Feb 2021 18:53:02 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id o21sm3168536pjp.42.2021.02.10.18.53.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Feb 2021 18:53:01 -0800 (PST)
Date: Thu, 11 Feb 2021 11:52:59 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 1/2] hw/nvme: move nvme emulation out of hw/block
Message-ID: <20210211025259.GB24885@localhost.localdomain>
References: <20210209110826.585987-1-its@irrelevant.dk>
 <20210209110826.585987-2-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210209110826.585987-2-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-09 12:08:25, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> With the introduction of the nvme-subsystem device we are really
> cluttering up the hw/block directory.
> 
> As suggested by Philippe previously, move the nvme emulation to
> hw/nvme.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Please add description about consolidation of nvme-ns.h and
nvme-subsys.h to the nvme.h for a unified header file when you apply
this patch! :)

Acked-by: Minwoo Im <minwoo.im.dev@gmail.com>

