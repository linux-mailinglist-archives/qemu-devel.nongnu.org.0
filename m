Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B62C5F682F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 15:32:29 +0200 (CEST)
Received: from localhost ([::1]:46534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogQzE-0008T3-J2
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 09:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogQWq-0003gV-MW
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:03:10 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:41517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogQWo-0007l4-Ro
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 09:03:08 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 q10-20020a17090a304a00b0020b1d5f6975so582828pjl.0
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 06:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YqjAhC54G+EIkgBOYuSZHUlo9+hbZNd6wOb6LaFYIDw=;
 b=mVB0oHmQPnf2F9M8eieZWmMFzsm2RhYBGyGkNVPdgGCCJM3FPY9piWgJkAemC5V9th
 fmerpBZV9qUEgz6opjP2DEYkTHvEaTH6luoYYimJ8T/6im12HPzCrs4QovwIVQCV10Ac
 2H2elkwrGvTZ0vDndhpLDoGIDZRAcbLWl+sWzQ0ClUDmDx8oqrW4Yc6VQsgYxfxhV4bU
 v5a8S7MbFokoYCTc1ZdVBrjEL3FQhR6be3BDTg71fGTjD9qnMCdhjrtfWAWwd70FSBxb
 RZtSDQJM9IOknLkcYRoDqlQjQRR4S6RfJS2hp9gZKEPySMAbzysf7Qg1jDAzkrSmaZ6D
 busA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YqjAhC54G+EIkgBOYuSZHUlo9+hbZNd6wOb6LaFYIDw=;
 b=4j0ifU5Wgqz8SFsV90eBrkTYnPQLeHXsfHPnJgZjd63RUwufryrmandNmioFphoaYr
 n2gO+pKfEa1OiJjU4bqmq0HC90Uvao6880Yxi+DWvz/CXz5fVhvmuDCmWrDIH1nWgrNC
 SAqkY3eLGwc1byDZE5ZbZ9bxyH3zbFEw2QZiTNY9om2TX9fA5V6YOxxUjjUIswml8ECX
 gj+WYXyk2jYyiPxQ70vY75VqVmQUiWk3NNFQdPt/VBixwsSM8W9QFzTSpFr5RCS34j/Y
 tyNA2LPaMJxntSJBHFQM5mMf0T5KP7oSs0lG+MosGqsGvYiG95LMc3U+/2xDyuG1VuER
 iPBQ==
X-Gm-Message-State: ACrzQf1BV05IuRbBWdkr1gfvhsvYbGQYNRAEj8DfLVBtr/1dUFWOz3Ma
 NpD11Hd+FedOhEBUHwgWtWgnChVPWeqn/+2pAWqxkg==
X-Google-Smtp-Source: AMsMyM6sBDEHxAGOuTK2ujuGqPRaQUslma6ncMXT+xEDJPJ+tshnAMbuOl3k7hhmS1tT/fBu9Xbjl9Zkwn5BxCsmYtY=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr4630873plb.60.1665061385149; Thu, 06
 Oct 2022 06:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221006113906.179963-1-mst@redhat.com>
In-Reply-To: <20221006113906.179963-1-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 14:02:53 +0100
Message-ID: <CAFEAcA8K-4KdjuG8QqFU9gLEiZ7A3Xx3zG0FP4uP4482p0GFfA@mail.gmail.com>
Subject: Re: [PATCH] gitmodules: recurse by default
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Oct 2022 at 13:36, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> The most commmon complaint about submodules is that
> they don't follow when one switches branches in the
> main repo. Enable recursing into submodules by default
> to address that.

Just to check, because the git docs are a bit unclear to me,
does this retain the existing behaviour that if a submodule
isn't checked out at all then it remains not-checked-out ?
(That is, we don't want to force developers to have checked
out submodule sources for all the edk2 and other rom blob
sources which aren't needed for day-to-day QEMU development.)

thanks
-- PMM

