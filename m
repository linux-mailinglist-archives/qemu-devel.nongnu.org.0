Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE1B3380C4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 23:45:26 +0100 (CET)
Received: from localhost ([::1]:50590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKU3Z-0001XR-73
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 17:45:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jklimek@gmail.com>) id 1lKNso-00038D-IP
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:09:54 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:41872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jklimek@gmail.com>) id 1lKNsl-0008Ia-Ol
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:09:54 -0500
Received: by mail-ed1-x536.google.com with SMTP id z1so3570063edb.8
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 08:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JVmiVnPE1od/UazbVcLMoPYXaoNVD7dYHdn2ZGqZrc8=;
 b=Zmrxez+G+Y3i3ZHy88m9DqYjqYOJdO7DYKW021aJZTu5foVKkePruhD6DgxtOQusRH
 kHcNfFBao7xS/zlyBqDPmj5DviD72e7VcFYVBlvULeCXYnG7PNVs9YIoUVNpXEsoLxT+
 EgU2dzQSJrm2lywZXSvfVBJQxeRiMPrwBDGWZ6kWnDqs3ZMZVaEPKmJYoZJ+uXNu6N/6
 25y7+LrcUGkGc3TFyWAs0XBUwfztAWOoG3+pIxojPBd53of10faeIjrigAQ5ORiAZjyY
 j04/q6zYbC5YwQnmJ4MlFiVnoSkE5XLXFwwBBmL3vNwsXh+CvppNM0ZNy0Jve4n9dAPF
 rmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JVmiVnPE1od/UazbVcLMoPYXaoNVD7dYHdn2ZGqZrc8=;
 b=QDQoTYTKz6FwQGxVNjcANqkn2tfU1zFuCdcVKekhRHywPyAe6/uAzBefm3TOOGiEz/
 x6oBo/LL9yDCiZvzCnh7Iz24WZfS9BHl/zZVQWPpV0XIkEBnmmGqdh5gHK2be9P47t8u
 sHkWGhRsPkLpMXGTRIqFafohGVB77B0x+q4boCOoCl8/CFDyqCSlhOnRXd95iK9vMxha
 csCKc8dVq7u0cwmtWvQBXnTBhZnjx6ixDRIz2XaYt7KM/96rENEBLfo4O05u9v5o7nvp
 m48UzU9RcxRGQRLcpYHQQkR6fOYOmN6IkzxAFBeMrr3XrvO9njGsuDFD5PGRgjbrAfW9
 nClw==
X-Gm-Message-State: AOAM530r6sb3ZIlKYUsr/RjV2Muw2jIgb5atTlrLPp2jk9Y9jeLmk12g
 pFRorWWiYFHqgItuAffEH8I2LI0usbagavzcoJ+frIBkKtQ=
X-Google-Smtp-Source: ABdhPJwO64eVrhRnIWbvpfwHbKwlgk5aDUJhKBtCnT35p1yDZK1i7kUvNEPrGDI8ZrUoBuHz+P/P4pzZ1ivJ4khuEpY=
X-Received: by 2002:a50:cc4a:: with SMTP id n10mr9424216edi.371.1615478988440; 
 Thu, 11 Mar 2021 08:09:48 -0800 (PST)
MIME-Version: 1.0
From: John Klimek <jklimek@gmail.com>
Date: Thu, 11 Mar 2021 11:09:38 -0500
Message-ID: <CAOEv1kaN60EjpbxjMq6=K2FFLiW3DbufiTg0evcA72h-2qyW_g@mail.gmail.com>
Subject: 3D Acceleration for Windows hosts?
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=jklimek@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Mar 2021 17:44:13 -0500
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

Does QEMU have any support for 3D acceleration on Windows hosts?

I'm not too familiar with video/graphics libraries, but it seems like
QEMU OpenGL support requires Mesa GBM which is only available for
Linux (DRM/KMS).

The other option is the Virgl3D renderer but that also requires Linux (DRM).

I'm not really sure if I know what I'm talking about so please correct
me if I'm wrong and also let me know if there is a way to enable 3D
acceleration under Windows hosts.

Thanks!

