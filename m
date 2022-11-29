Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F29B63C9FB
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 22:02:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p07jd-00089o-VV; Tue, 29 Nov 2022 16:01:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p07jX-00088i-SA
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 16:01:39 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p07jW-0003QJ-7Z
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 16:01:39 -0500
Received: by mail-yb1-xb30.google.com with SMTP id e141so19097794ybh.3
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 13:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1NiVJEZDT3YKx4m8vey37dk812IOxMabxZymhyZ4DjI=;
 b=XozlwRI/M+SeWudzkoh2WUXjXt8ySzBz3tvXQI+lrsYwJQ5x9QRuxoLPJ3Ti6lfQbf
 gsA69krwZkcn5Hmw4BBxyWJay2AMoHss+O23DJOJtvOEHfkRS6kkuZpyuD2aBeZyyidi
 1xDvmk5LXWfHGt1zDIdneVkrvQz+565oyD3ngU0W/10vUWQ9IkZZuOKvaxggDEs+QqTr
 9W4GqwaSBoqh5Ot23+tsfd4TiHg7NkJgQPj9cpcz9IQmo92ZIB+qWHVlcFmGuIK5mueG
 BSwSq1ymvcY1ANB+v+bjNfcjRCN0js37Q504mQKzDBD5tK9V8HFD00468WjXY22owEEt
 n40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1NiVJEZDT3YKx4m8vey37dk812IOxMabxZymhyZ4DjI=;
 b=fXgq+qCD0k928lzSnM+wJ9nQu2kKOw3Gxpu3O/5diNGdmyZqNmKvXhQqI8V3ln2Bxr
 DclFDGokdhL2gnVioM4oKXWHapnPB/5wGwdiUcBPWjn69hzjfWiI+XhpPVOQDSw768j0
 lqimUA2to4DVnm7BzVhS6Y52Vtl+fGTVC9XQ6+36Pf85hk3arzIdogslLP4+S9CMnqgy
 nQlJuVUEkHRdF5xdAh17jxd+qd+7s2FK65NsM29rtDIx4Tcf8XJC5BWk1OBuri6xbB2D
 IcZhPWEor9//OU8t6FjjqjT6QPxK5bR63nbWNDiToXfmgEtV6cO3Ogax/60jhgs9P5rs
 ao3A==
X-Gm-Message-State: ANoB5pnfdkDu29pDfTb/IUFRnQmC/rVpflfqASi5RzwaqLmnN3TeKjPq
 7UvR4bUEDt5IoLwDGcRbagzvTxjAq2T9O6jpr+k=
X-Google-Smtp-Source: AA0mqf43n8uta7V/FmzzPakKmsWbTmHlZJHWORRlw5TMogqoCFHA3R9irrffhfeEGauhOuAwUU2cPjyhRIjs5cDs+OM=
X-Received: by 2002:a25:4181:0:b0:6f9:8f1:4d02 with SMTP id
 o123-20020a254181000000b006f908f14d02mr4543448yba.118.1669755696971; Tue, 29
 Nov 2022 13:01:36 -0800 (PST)
MIME-Version: 1.0
References: <20221128164105.1191058-1-alex.bennee@linaro.org>
 <20221128164105.1191058-5-alex.bennee@linaro.org>
 <CAJSP0QX1R4Z+AC3591MpwzBAG1Tz3rDTe4+o2rbe0v-q6sSKMw@mail.gmail.com>
 <8735a2yigb.fsf@linaro.org>
In-Reply-To: <8735a2yigb.fsf@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 29 Nov 2022 16:01:25 -0500
Message-ID: <CAJSP0QWxN2UxaNqST64G=tyUVLn8zbwzotLxHNQ6d6xPTeocgg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] hw/virtio: ensure a valid host_feature set for
 virtio-user-gpio
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com, 
 marcandre.lureau@redhat.com, stefanha@redhat.com, mathieu.poirier@linaro.org, 
 viresh.kumar@linaro.org, sgarzare@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Alex,
I'm waiting for a v4 or a confirmation that you've retested and I can
just drop this patch.

Thanks!

Stefan

